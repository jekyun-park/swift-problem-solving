import Foundation

func solution(_ str1:String, _ str2:String) -> String {
    
    var answer = ""
    var count = str1.count
    
    let str1Array = Array(str1)
    let str2Array = Array(str2)
    
    for i in 0..<count {
        answer += String(str1Array[i])
        answer += String(str2Array[i])
    }
    
    return answer
}