//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/02/05.
//

import Foundation

let mazeSize = readLine()!.split(separator: " ").map { Int($0)! }
let N = mazeSize[0]; let M = mazeSize[1]
var maze: [[Int]] = []
var dist: [[Int]] = Array(repeating: Array(repeating: -1, count: M), count: N)
var queue: [(Int, Int)] = []

for _ in 0..<N {
    maze.append(readLine()!.map { Int(String($0))! })
}

let dx = [1, -1, 0, 0]
let dy = [0, 0, 1, -1]

queue.append((0, 0))
dist[0][0] = 0
var idx = 0

while idx < queue.count {
    let (x, y) = queue[idx]
    idx += 1

    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]

        if nx < 0 || nx >= N || ny < 0 || ny >= M { continue }
        if dist[nx][ny] >= 0 || maze[nx][ny] != 1 { continue }
        
        queue.append((nx,ny))
        dist[nx][ny] = dist[x][y] + 1

        }
    }

print(dist[N-1][M-1]+1)
