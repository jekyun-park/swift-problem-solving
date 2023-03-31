import Foundation

func solution(_ myString:String) -> Int {
    
    var answer: Int = 0
    var number: String = ""
    
    for char in myString {
        if char.isNumber { 
            number.append(String(char))
        } else {
            if !number.isEmpty {
                answer += Int(number)!   
            }
            
            number = ""
        }
    }
    
    if !number.isEmpty {
        answer += Int(number)!   
    }
    
    return answer
}