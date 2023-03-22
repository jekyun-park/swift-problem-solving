import Foundation

func solution(_ numbers:String) -> Int64 {
    let numberDictionary: [String: String] = [
        "zero": "0",
        "one": "1",
        "two": "2",
        "three": "3",
        "four": "4",
        "five": "5",
        "six": "6",
        "seven": "7",
        "eight": "8",
        "nine": "9"
    ]
    
    var answer: String = numbers
    
    for key in Array(numberDictionary.keys) {
        answer = answer.replacingOccurrences(of: key, with: numberDictionary[key]!)
    }
    
    return Int64(answer)!
}