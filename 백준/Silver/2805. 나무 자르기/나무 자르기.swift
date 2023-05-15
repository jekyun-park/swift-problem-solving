import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
let trees = readLine()!.split(separator: " ").map { Int($0)! }

var left = 0
var right = trees.reduce(0, +)

while left <= right {
    var heights = 0
    let mid = (left + right) / 2
    
    for tree in trees {
        if tree > mid {
            heights += tree - mid
        }
    }
    
    if heights >= m {
        left = mid + 1
    } else {
        right = mid - 1
    }
    
}

print(right)