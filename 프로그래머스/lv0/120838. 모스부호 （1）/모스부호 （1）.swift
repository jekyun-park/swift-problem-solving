import Foundation

func solution(_ letter:String) -> String {
    var answer = ""
    
    let morseCode = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
    
    let alphabets = (97...122).map({String(UnicodeScalar($0))})
    
    let splitted = letter.split(separator: " ")
    
    for code in splitted {
        guard let index = morseCode.firstIndex(of: String(code)) else { return "" }
        answer.append(alphabets[index])
    }
    
    return answer
}