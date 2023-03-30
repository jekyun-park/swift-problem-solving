import Foundation

func solution(_ n:Int) -> Int {
    
    let x = Double(Int(sqrt(Double(n))))
    
    return Int(pow(x,2)) == n ? 1 : 2
}