import Foundation

let N = Int(readLine()!)!

var info = [(Int, Int)]()

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    info.append((input[0], input[1]))
}

var value = [Int]()

for person in info {
    value.append(info.filter { $0.0 > person.0 && $0.1 > person.1 }.count)
}

value.forEach { print($0+1, terminator: " ") }