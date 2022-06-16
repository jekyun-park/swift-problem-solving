//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/14.
//  BOJ > 10026 > 적록색약

import Foundation

let N = Int(readLine()!)!
var map: [[String]] = []

for _ in 0..<N {
    map.append((Array(readLine()!).map { String($0) }))
}

func isInRange(_ r: Int, _ c: Int) -> Bool {
    return (0..<N ~= r) && (0..<N ~= c)
}

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

var queue: [(x: Int, y: Int)] = []
var visited = Array(repeating: Array(repeating: false, count: N), count: N)

func bfs(_ x: Int, _ y: Int) {
    queue.append((x, y))
    visited[x][y] = true

    var queueIndex: Int = 0
    while queueIndex < queue.count {

        let (x, y) = queue[queueIndex]
        visited[x][y] = true
        queueIndex += 1

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            if !isInRange(nx, ny) { continue }
            if visited[nx][ny] { continue }
            if map[x][y] != map[nx][ny] { continue }

            visited[nx][ny] = true
            queue.append((nx, ny))
        }
    }
}

func countArea() -> Int {
    var count = 0
    for i in 0..<N {
        for j in 0..<N {
            if !visited[i][j] {
                count += 1
                bfs(i, j)
            }
        }
    }
    return count
}

let notColorWeakness = countArea()

visited = Array(repeating: Array(repeating: false, count: N), count: N)
queue.removeAll()

// 맵 색상 변경 -> 적록색약인 사람은 R == G 로 보기 때문에 맵을 바꿔줌
for i in 0..<N {
    for j in 0..<N {
        if map[i][j] == "R" {
            map[i][j] = "G"
        }
    }
}

let colorWeakness = countArea()

print(notColorWeakness, colorWeakness)
