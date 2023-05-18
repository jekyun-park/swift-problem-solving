import Foundation

let dice = readLine()!.split(separator: " ").map { Int($0)! }
var diceArray = Array(repeating: 0, count: 7)
dice.forEach { diceArray[$0] += 1 }

if diceArray.contains(3) {
  let eye = diceArray.firstIndex(of: 3)!
  print(10000 + eye * 1000)
} else if diceArray.contains(2) {
  let eye = diceArray.firstIndex(of: 2)!
  print(1000 + eye * 100)
} else {
  let biggestEye = diceArray.lastIndex { $0 > 0 }!
  print(biggestEye * 100)
}