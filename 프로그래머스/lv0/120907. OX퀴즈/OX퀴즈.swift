import Foundation

func solution(_ quiz:[String]) -> [String] {
    var answer = [String]()
    
    for question in quiz {
        var isPlus = false
        let splitted = question.split(separator: "=")
        let result = Int(splitted[1].split(separator: " ").first!)!
        let expression = splitted[0].split(separator: " ")
        expression[1] == "-" ? (isPlus = false) : (isPlus = true)

        if isPlus {
          result == Int(expression[0])! + Int(expression[2])! ? answer.append("O") : answer.append("X")
        } else {
            result == Int(expression[0])! - Int(expression[2])! ? answer.append("O") : answer.append("X")
        } 
    }
    
    return answer
}