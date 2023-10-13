import Foundation

func solution(_ n:Int64) -> Int64 {    
    return Double(n).squareRoot().truncatingRemainder(dividingBy: 1.0).isZero ? Int64(pow(Double(n).squareRoot() + 1,2)) : -1
}