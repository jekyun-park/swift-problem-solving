import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
  var PS = readLine()!
  var outputStack = [Character]()

  while !PS.isEmpty {
    guard let popped = PS.popLast() else { break }
    if let top = outputStack.last {
      if top == ")" && popped == "(" {
        outputStack.popLast()
        continue
      }
    }
    outputStack.append(popped)
  }

  outputStack.isEmpty ? print("YES") : print("NO")
}