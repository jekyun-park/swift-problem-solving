import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    
    let kNumber = String(n, radix: k)
    let splitted = kNumber.split(separator: "0").map { Int(String($0))! }
    
    return splitted.filter { isPrime($0) }.count
}

func isPrime(_ n: Int) -> Bool {
    
    if n <= 1 { return false }
    let root = Int(sqrt(Double(n)))
    
    for i in 2..<(root+1) {
        if n % i == 0 { return false }
    }
    
    return true
}