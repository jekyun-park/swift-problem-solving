import Foundation

let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: N+1)

if 0...6 ~= N {
  print(N)
  exit(0)
}

for i in 0...6 {
  dp[i] = i
}

for i in 7...N {
  dp[i] = dp[i-3] * 2
  dp[i] = max(dp[i], dp[i-5] * 4)
  dp[i] = max(dp[i], dp[i-4] * 3)
}

print(dp[N])