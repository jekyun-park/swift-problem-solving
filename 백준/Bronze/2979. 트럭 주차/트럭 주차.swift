import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let A = input[0], B = input[1], C = input[2]

var times: [(in: Int, out: Int)] = []
var answer = 0

for _ in 0..<3 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    times.append((input.first!, input.last!))
}

var array = Array(repeating: 0, count: 100)

times.forEach {
    for i in $0.in-1...$0.out-2 {
        array[i] += 1
    }
}

array.forEach {
    switch $0 {
    case 1:
        answer += A
    case 2:
        answer += 2 * B
    case 3:
        answer += 3 * C
    default: break
    }
}

print(answer)