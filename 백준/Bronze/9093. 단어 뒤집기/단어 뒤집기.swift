import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
  print(String(readLine()!.split(separator: " ").map { $0.reversed() }.joined(separator: " ")))
}