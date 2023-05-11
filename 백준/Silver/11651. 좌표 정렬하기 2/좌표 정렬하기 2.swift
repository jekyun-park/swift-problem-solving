import Foundation

var coordinates = [(x: Int, y: Int)]()

let N = Int(readLine()!)!
for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    coordinates.append((input[0], input[1]))
}

coordinates.sort { a, b in
    if a.y == b.y {
        return a.x < b.x
    } else {
        return a.y < b.y
    }
}

for coordinate in coordinates {
    print(coordinate.x, coordinate.y)
}