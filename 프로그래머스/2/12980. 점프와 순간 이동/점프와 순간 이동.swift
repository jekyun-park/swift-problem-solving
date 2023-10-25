import Foundation

func solution(_ n: Int) -> Int {
    
    var n = n
    var answer = 0
    
    while n > 0 {
        answer += (n % 2)
        if n % 2 == 0 {
            n /= 2
        } else {
            n -= 1
        }
    }
    
    return answer
}