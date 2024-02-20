import Foundation

let S = readLine()!.split(separator: " ").map { Int($0)! }[1]
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var depth = [Int]()
var answer = 0

func combination(start: Int, depth: inout [Int], target: Int) {
  if depth.count == target {
    if depth.reduce(0, +) == S { answer += 1 }
    return
  }

  for i in (start+1)..<numbers.count {
    depth.append(numbers[i])
    combination(start: i, depth: &depth, target: target)
    depth.popLast()
  }

  return
}
for i in 1...numbers.count {
  combination(start: -1, depth: &depth, target: i)
}

print(answer)