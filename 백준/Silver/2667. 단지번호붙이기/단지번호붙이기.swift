import Foundation

func dfs(_ x: Int, _ y: Int)  {
  if visited[x][y] { return }

  visited[x][y] = true

  if map[x][y] == "1" {
    count += 1
    for i in 0..<4 {
      let newX = x + dx[i]
      let newY = y + dy[i]
      guard 0..<N ~= newX && 0..<N ~= newY else { continue }
      dfs(newX, newY)
    }
  }
}

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
var map: [[Character]] = []
let N = Int(readLine()!)!
var visited = Array(repeating: Array(repeating: false, count: N), count: N)
var answer = [Int]()
var count = 0

for _ in 0..<N {
  map.append(Array(readLine()!))
}

for i in 0..<N {
  for j in 0..<N {
    if !visited[i][j] && map[i][j] == "1" {
      count = 0
      dfs(i, j)
      answer.append(count)
    }
  }
}

answer.sort()
print(answer.count)
answer.forEach { print($0) }