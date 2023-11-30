import Foundation

func solution(_ n: Int) -> Int {
    var answer  = 0
    
    for i in 2...n {
        if isPrime(i) {
            answer += 1
        }
    }
    return answer
}

func isPrime(_ n: Int) -> Bool {  
    let root = Int(sqrt(Double(n)))+1
    
    for i in 2..<root {
        if n % i == 0 {
            return false
        }
    }
    return true
}