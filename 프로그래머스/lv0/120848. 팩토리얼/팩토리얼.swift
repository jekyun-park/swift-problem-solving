import Foundation

func solution(_ n:Int) -> Int {
    for i in 1...n {
        if factorial(i) == n {
            return i
        } else if factorial(i) > n {
            return i-1
        }
    }
    return 0
}

func factorial(_ n: Int) -> Int {
    if n == 0 { return 1 }
    return n * factorial(n-1)
}