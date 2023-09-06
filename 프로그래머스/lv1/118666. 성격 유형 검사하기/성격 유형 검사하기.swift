import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    
    var answer = ""
    
    var dictionary: [String: Int] = [
        "R": 0,
        "T": 0,
        "C": 0,
        "F": 0,
        "J": 0,
        "M": 0,
        "A": 0,
        "N": 0,
    ]
    
    for (string, value) in zip(survey, choices) {
        switch value {
            case 1:
                dictionary[String(string.dropLast())]! += 3
            case 2:
                dictionary[String(string.dropLast())]! += 2   
            case 3:
                dictionary[String(string.dropLast())]! += 1
            case 4:
                continue
            case 5:
                dictionary[String(string.dropFirst())]! += 1
            case 6:
                dictionary[String(string.dropFirst())]! += 2
            case 7:
                dictionary[String(string.dropFirst())]! += 3
            default:
                break
        }
    }
    
    dictionary["R"]! >= dictionary["T"]! ? (answer += "R") : (answer += "T")
    dictionary["C"]! >= dictionary["F"]! ? (answer += "C") : (answer += "F")
    dictionary["J"]! >= dictionary["M"]! ? (answer += "J") : (answer += "M")
    dictionary["A"]! >= dictionary["N"]! ? (answer += "A") : (answer += "N")
    
    return answer
}