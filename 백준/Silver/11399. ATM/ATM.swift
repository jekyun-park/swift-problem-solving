import Foundation

let N = Int(readLine()!)!
let times = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var answer = 0
for i in 0..<times.count { answer += times[0...i].reduce(0, +) }
print(answer)