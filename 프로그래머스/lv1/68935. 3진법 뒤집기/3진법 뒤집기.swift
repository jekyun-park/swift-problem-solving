import Foundation

func solution(_ n:Int) -> Int {
    
    var number = Int(String(String(n, radix: 3).reversed()))!
    var answer: Int = 0
    var exp = 1
    
    while (number != 0) {
        answer += (number % 10) * exp
        number /= 10
        exp *= 3
    }
    
    return answer
}