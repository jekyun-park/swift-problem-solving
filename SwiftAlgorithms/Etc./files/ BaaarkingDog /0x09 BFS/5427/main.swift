//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/14.
//  BOJ > 5427 > 불

import Foundation

let N = Int(readLine()!)!
let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

for _ in 0..<N {

    let wh = readLine()!.split(separator: " ").map { Int($0)! }
    let w = wh[0], h = wh[1]

    func isInRange(_ x: Int, _ y: Int) -> Bool {
        return 0..<h ~= x && 0..<w ~= y
    }

    var map: [[String]] = []
    var queue: [(Int, Int)] = []
    var fireLocation: [(x: Int, y: Int)] = []
    var canEscape = false

    for _ in 0..<h {
        map.append((Array(readLine()!).map { String($0) }))
    }

    var fireVisited = Array(repeating: Array(repeating: 0, count: w), count: h)
    var visited = Array(repeating: Array(repeating: 0, count: w), count: h)


    for i in 0..<h {
        for j in 0..<w {
            if map[i][j] == "*" {
                fireLocation.append((i, j))
                fireVisited[i][j] = 1
            }
            if map[i][j] == "@" {
                queue.append((i, j))
                visited[i][j] = 1
            }
        }
    }

    var queueIndex = 0

    while queueIndex < fireLocation.count {

        let (x, y) = fireLocation[queueIndex]
        queueIndex += 1

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            if !isInRange(nx, ny) { continue }
            if map[nx][ny] == "#" { continue }
            if fireVisited[nx][ny] > 0 { continue }

            fireVisited[nx][ny] = fireVisited[x][y] + 1
            fireLocation.append((nx, ny))
        }
    }

    queueIndex = 0
    
    while (queueIndex < queue.count) && !canEscape {

        let (x, y) = queue[queueIndex]
        queueIndex += 1

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            if !isInRange(nx, ny) {
                print(visited[x][y])
                canEscape = true
                break
            }

            if map[nx][ny] == "#" { continue }
            if visited[nx][ny] > 0 { continue }
            if fireVisited[nx][ny] != 0 && fireVisited[nx][ny] <= visited[x][y] + 1 { continue }

            visited[nx][ny] = visited[x][y] + 1
            queue.append((nx,ny))
        }
    }
    
    if !canEscape { print("IMPOSSIBLE") }
}


