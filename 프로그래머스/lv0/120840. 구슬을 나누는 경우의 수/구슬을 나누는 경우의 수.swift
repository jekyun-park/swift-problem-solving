import Foundation

func solution(_ balls: Int, _ share: Int) -> Int {
    
    let answer = (factorial(balls)) / ((factorial(balls - share)) * (factorial(share)))
    
    return Int(NSDecimalNumber(decimal: answer))
}

func factorial(_ n: Int) -> Decimal {
    if n <= 0 { return 1 }
    return Decimal(n) * factorial(n-1)
}