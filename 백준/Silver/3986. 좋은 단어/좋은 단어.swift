import Foundation

let n = Int(readLine()!)!
var words: [String] = []
var answer = 0

for _ in 0..<n {
    words.append(readLine()!)
}

for word in words {
    var stack: [Character] = word.map { Character(extendedGraphemeClusterLiteral: $0) }
    var array = [Character]()
    while !stack.isEmpty {
        guard let character = stack.popLast() else { continue }
        if array.isEmpty {
            array.append(character)
        } else if array.last == character {
            let _ = array.popLast()
        } else {
            array.append(character)
        }
    }
    if array.count == 0 { answer += 1 }
}

print(answer)