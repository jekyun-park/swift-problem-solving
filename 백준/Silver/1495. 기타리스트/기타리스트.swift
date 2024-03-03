import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let V = [0] + readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], s = input[1], m = input[2]
var results = Array(repeating: Array(repeating: false, count: m+1), count: n+1)
var lastSong = 0
var answer = -1

results[0][s] = true

for i in 1...n {
  var isPossible = false
  for j in 0...m {
    let previous = results[i-1][j]
    
    if previous {
      if j - V[i] >= 0 {
        results[i][j - V[i]] = true
        isPossible = true
      }

      if j + V[i] <= m {
        results[i][j + V[i]] = true
        isPossible = true
      }
    }
  }

  lastSong = i
  if !isPossible { break }
}

for i in (0...m).reversed() {
  if results[lastSong][i] {
    answer = i
    break
  }
}

print(answer == -1 ? -1 : answer)