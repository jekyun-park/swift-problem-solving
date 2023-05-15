import Foundation

var N = Int(readLine()!)!
var dp = Array(repeating: 6000, count: 5001)
dp[3] = 1
dp[5] = 1

if N >= 6 {
    for i in 6...N {
        dp[i] = min(dp[i-3] + 1, dp[i-5] + 1)
    }
} 
print(dp[N] >= 6000 ? -1 : dp[N])