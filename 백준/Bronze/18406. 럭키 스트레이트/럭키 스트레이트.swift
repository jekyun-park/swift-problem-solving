let N = readLine()!.map { Int(String($0))! }
let lhs = N[0...(N.count/2 - 1)].reduce(0, +)
let rhs = N[(N.count/2)...].reduce(0, +)

print(lhs == rhs ? "LUCKY" : "READY")