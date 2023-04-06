import Foundation

func solution(_ i:Int, _ j:Int, _ k:Int) -> Int {
    var answer = 0
    
    for number in (i...j) {
        answer += String(number).map { String($0) }.filter { $0 == String(k) }.count
    }
    
    return answer
}