import Foundation

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = nk[0]
var K = nk[1]
var coins = [Int]()
for _ in 0..<N { coins.append(Int(readLine()!)!) }

var answer = 0

while K > 0 {

  var maximum = Int.min
  for coin in coins {
    if K/coin != 0 {
      maximum = max(coin, maximum)
    }
  }

  let quotient = K / maximum
  answer += quotient
  K -= quotient * maximum
}

print(answer)