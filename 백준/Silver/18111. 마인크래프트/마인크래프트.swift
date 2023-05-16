import Foundation

let nmb = readLine()!.split(separator: " ").map { Int($0)! }
let N = nmb[0], M = nmb[1], B = nmb[2]
var map = [[Int]]()
var answer: (time: Int, height: Int) = (Int.max, 0)
for _ in 0..<N {
    map.append(
        readLine()!.split(separator: " ").map { Int($0)! }
    )
}

for h in 0...256 {
    var plus = 0
    var minus = 0
    
    for i in 0..<N {
        for j in 0..<M {
            if map[i][j] > h {
                minus += map[i][j] - h
            } else {
                plus += h - map[i][j]
            }
        }
    }
    
    if (B + minus >= plus) {
        let spendTime = minus * 2 + plus
        if (spendTime <= answer.time) {
            answer.time = spendTime
            answer.height = h
        }
    }
}

print(answer.time, answer.height)