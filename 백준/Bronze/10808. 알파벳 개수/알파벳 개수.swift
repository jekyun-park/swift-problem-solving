import Foundation

let input = readLine()!
var answer = [Int](repeating: 0, count: 26)
input.forEach {
    answer[Int(((Character(extendedGraphemeClusterLiteral: $0).asciiValue!)))-97] += 1
}
answer.forEach {
    print($0, terminator: " ")
}