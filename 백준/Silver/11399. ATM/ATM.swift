import Foundation

let N = Int(readLine()!)!
let times = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var answer = 0
for (index, value) in times.enumerated() {
  answer += times[0...index].reduce(0, +)
}
print(answer)