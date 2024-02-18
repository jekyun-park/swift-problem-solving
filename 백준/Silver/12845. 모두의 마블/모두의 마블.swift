import Foundation

let n = Int(readLine()!)!
var cards = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
var answer = 0
for i in 1..<cards.count {
  answer += cards[i] + cards[i-1]
  cards[i] = cards[i-1]
}
print(answer)