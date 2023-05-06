import Foundation

let N = Int(readLine()!)!
var i = 2
var level = 1

while true {
    if i > N { break }
    i += 6 * level
    level += 1
}

print(level)