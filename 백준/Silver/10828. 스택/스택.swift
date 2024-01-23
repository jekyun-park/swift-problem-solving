import Foundation

let N = Int(readLine()!)!
var stack: [Int] = []

for _ in 0..<N {
  let splitted = readLine()!.split(separator: " ")
  let op = splitted.first!

  switch op {
  case "push":
    stack.append(Int(splitted.last!)!)
  case "pop":
    stack.isEmpty ? print(-1) : print(stack.popLast()!)
  case "size":
    print(stack.count)
  case "empty":
    stack.isEmpty ? print(1) : print(0)
  case "top":
    stack.isEmpty ? print(-1) : print(stack.last!)
  default:
    break
  }
}