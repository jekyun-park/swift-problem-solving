import Foundation

func solution(_ n:Int) -> [Int] {
    
    let sqrtNumber = sqrt(Double(n))
    var n = Double(n)
    var answer = [Int]()
    
    var divisor = 2.0
    
    
    while divisor <= sqrtNumber, n != 1 {
        if Int(n) % Int(divisor) == 0 { 
            answer.append(Int(divisor))
            n /= divisor
        } else {
            divisor += 1
        }
    }
    
    if n > 1 {
        answer.append(Int(n))
    }
    
    answer = Array(Set(answer)).sorted(by: <)
    
    return answer
}
