import Foundation

func solution(_ myString:String, _ num1:Int, _ num2:Int) -> String {
    var answer = myString
    
    let temp = answer[String.Index(utf16Offset: num1, in: answer)]
    
    answer.remove(at: String.Index(utf16Offset: num1, in: answer))
    answer.insert(myString[String.Index(utf16Offset: num2, in: answer)], at: String.Index(utf16Offset: num1, in: answer))
    answer.remove(at: String.Index(utf16Offset: num2, in: answer))
    answer.insert(temp, at: String.Index(utf16Offset: num2, in: answer))
    
    return answer
}