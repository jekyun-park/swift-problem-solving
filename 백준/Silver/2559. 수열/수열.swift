import Foundation

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let n = nk[0], k = nk[1]
let temperatures = readLine()!.split(separator: " ").map { Int($0)! }
var sum = Array(repeating: 0, count: temperatures.count)
var answers = [Int]()

sum[0] = temperatures[0]

for i in 1..<temperatures.count {
    sum[i] = sum[i-1] + temperatures[i]
}

answers.append(sum[k-1])

for i in 0..<n {
    if i + k >= n {
        break
    }
    answers.append(sum[i+k] - sum[i])
}

print(answers.max()!)