import Foundation

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = nk[0]
var K = nk[1]
var coins = [Int]()
for _ in 0..<N { coins.append(Int(readLine()!)!) }

var answer = 0

while K > 0 {
  guard let price = coins.popLast() else { break }
  let q = K / price
  K -= q * price
  answer += q
}

print(answer)