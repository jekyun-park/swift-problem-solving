import Foundation

func solution(_ myString:String) -> Int {
    var answer = 0
    var isPlus = true
    let splitted = myString.split(separator:" ").map { String($0) }
    
    for i in 0..<splitted.count {
        if let number = Int(splitted[i]) {
            isPlus ? (answer += number) : (answer -= number)
        } else {
            splitted[i] == "+" ? (isPlus = true) : (isPlus = false)
        }
    }
    
    return answer
}