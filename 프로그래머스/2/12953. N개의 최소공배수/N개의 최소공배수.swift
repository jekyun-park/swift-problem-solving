func solution(_ arr:[Int]) -> Int {
    return arr.reduce(1) { lcm($0, $1)}
}

func gcd(_ a: Int, _ b: Int) -> Int {
    let r = a % b 
    if r != 0 {
        return gcd(b, r)
    } else {
        return b
    }
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}