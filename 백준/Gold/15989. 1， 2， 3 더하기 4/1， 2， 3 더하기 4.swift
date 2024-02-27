import Foundation

let T = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 3), count: 10001)
dp[1][0] = 1
dp[2][0] = 1
dp[2][1] = 1
dp[3][0] = 1
dp[3][1] = 1
dp[3][2] = 1
for i in 4..<10_001 {
  dp[i][0] = dp[i-1][0]
  dp[i][1] = dp[i-2][0] + dp[i-2][1]
  dp[i][2] = dp[i-3][0] + dp[i-3][1] + dp[i-3][2]
}

for _ in 0..<T {
  let N = Int(readLine()!)!
  print(dp[N].reduce(0, +))
}