import Foundation

func solution(_ myString:String, _ n:Int) -> String {
    
    var answer = ""
    
    myString.forEach { 
        answer += String(repeating: $0, count: n) 
    }
    
    return answer
}