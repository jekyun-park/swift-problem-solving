let N = Int(readLine()!)!
var players: [String: Int] = [:]
for _ in 0..<N {
    players[String(readLine()!.first!), default: 0] += 1
}

if players.values.contains(where: { $0 >= 5 }) {
    let result = players.filter { $0.value >= 5 }.keys.sorted(by: <).joined()
    print(result)
} else {
    print("PREDAJA")
}