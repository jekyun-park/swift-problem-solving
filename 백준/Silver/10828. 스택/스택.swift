import Foundation

let N = Int(readLine()!)!
var stack: [Int] = []

for _ in 0..<N {
  let input = readLine()!
  switch input {
  case "pop":
    stack.isEmpty ? print(-1) : print(stack.popLast()!)
  case "size":
    print(stack.count)
  case "empty":
    stack.isEmpty ? print(1) : print(0)
  case "top":
    stack.isEmpty ? print(-1) : print(stack.last!)
  default: // push case
      let splitted = input.split(separator: " ")
      let number = Int(splitted.last!)!
      stack.append(number)
  }
}