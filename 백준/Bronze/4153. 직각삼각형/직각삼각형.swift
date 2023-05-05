import Foundation

while true {
    let input = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
    if input[0] == 0, input[1] == 0, input[2] == 0 { break }
    input[0] * input[0] == input[1] * input[1] + input[2] * input[2] ? print("right") : print("wrong")
}