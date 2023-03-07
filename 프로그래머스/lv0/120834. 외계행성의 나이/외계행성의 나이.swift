import Foundation

func solution(_ age:Int) -> String {
    var answer: String = ""
    let alphabets = (97...122).map({String(UnicodeScalar($0))})
    
    String(age).forEach {         
        answer += alphabets[Int(String($0))!]
    }
    
    return answer
}