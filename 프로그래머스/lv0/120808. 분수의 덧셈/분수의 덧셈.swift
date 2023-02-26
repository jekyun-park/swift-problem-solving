import Foundation

func solution(_ numer1:Int, _ denom1:Int, _ numer2:Int, _ denom2:Int) -> [Int] {
    
    let numer = (numer1 * denom2) + (numer2 * denom1)
    let denom = denom1 * denom2
    
    let gcd = getGcd(numer,denom)
    
    return [numer/gcd, denom/gcd]
}

func getGcd(_ num1: Int, _ num2: Int) -> Int {
    
    if num1 % num2 != 0 {
        return getGcd(num2, num1 % num2)
    } else {
        return num2
    }
    
}