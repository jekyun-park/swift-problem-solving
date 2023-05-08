import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let k = Int(readLine()!)!
    let n = Int(readLine()!)!
    
    var peopleCount = [Array(1...n)] + Array(repeating: Array(repeating: 0, count: n), count: k-1)
    
    for i in 1..<k {
        for j in 0..<n {
            peopleCount[i][j] = peopleCount[i-1][0...j].reduce(0, +)
        }
    }
    
    print(peopleCount.last!.reduce(0, +))
}