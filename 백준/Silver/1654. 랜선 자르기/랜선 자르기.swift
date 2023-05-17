import Foundation

let kn = readLine()!.split(separator: " ").map { Int($0)! }
let K = kn[0], N = kn[1]
var lines = [Int]()

for _ in 0..<K {
    lines.append(Int(readLine()!)!)
}

var left: Int = 1
var right: Int = lines.max()!
var answer = 0

while left <= right {

    let mid: Int = (left + right) / 2
    var count = 0
    
    for line in lines {
        count += line/mid
    }

    if count < N {
        right = mid - 1
    } else {
        answer = mid
        left = mid + 1
    }

}

print(answer)