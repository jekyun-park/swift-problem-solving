import Foundation

func solution(_ a:Int, _ b:Int) -> Int {
    
    let gcd = getGcd(a, b)   
    var denom = (b/gcd)
    var factor = 2
    var factors = [Int]()
    
    while pow(Double(factor), 2) <= Double(denom) {
        while denom % factor == 0 {
            factors.append(factor)
            denom /= factor
        }
        factor += 1
    }
    
    if denom > 1 { factors.append(denom) }
    let sortedFactors = Array(Set(factors)).sorted()
    
    return  sortedFactors.isEmpty || sortedFactors == [2, 5] || sortedFactors == [2] || sortedFactors == [5] ? 1 : 2
}


func getGcd(_ num1: Int, _ num2: Int) -> Int {
    
    if num1 % num2 != 0 {
        return getGcd(num2, num1 % num2)
    } else {
        return num2
    }
    
}