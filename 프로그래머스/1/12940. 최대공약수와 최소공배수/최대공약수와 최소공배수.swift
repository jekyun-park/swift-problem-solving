func solution(_ n:Int, _ m:Int) -> [Int] {
    return [gcd(n, m), lcm(n, m)]
}

func gcd(_ n: Int, _ m: Int) -> Int {
    var n = n
    var m = m
    var r: Int
    
    while (n != 0) {
        r = m % n
        m = n
        n = r
    }
    
    return m
}

func lcm(_ n: Int, _ m: Int) -> Int {
    return n*m / gcd(n, m)
}