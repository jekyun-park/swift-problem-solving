func solution(_ n:Int) -> Int {
    return dp(n)
}

func dp(_ n: Int) -> Int {
    if n <= 2 { return n }
    var dp: [Int] = [0, 1, 2]

    for i in 3...n {
        dp.append((dp[i-2] + dp[i-1]) % 1234567)
    }

    return dp[n]
}