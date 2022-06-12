//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/05/06.
//  BOJ > 4179 > 불!

import Foundation

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

let RC = readLine()!.split(separator: " ").map { Int($0)! }
let R = RC[0], C = RC[1]
var map: [[String]] = []
var queue: [(Int, Int)] = []
var fireQueue: [(Int, Int)] = []
var visited = Array(repeating: Array(repeating: false, count: 1001), count: 1001)
var isPossible = false

for _ in 0..<R {
    map.append(readLine()!.map { String($0) })
}

for i in 0..<R {
    for j in 0..<C {
        if map[i][j] == "J" {
            map[i][j] = "."
            visited[i][j] = true
            queue.append((i,j))
        } else if map[i][j] == "F" {
            fireQueue.append((i,j))
        }
    }
}

var time = 0
var fire = 0
var jihoon = 0

while (jihoon < queue.count) && !isPossible {

    time += 1

    let fireLeft = fire
    fire = fireQueue.count

    for index in fireLeft..<fireQueue.count {
        let (fireX, fireY) = fireQueue[index]

        for i in 0..<4 {
            let newFireX = fireX + dx[i]
            let newFireY = fireY + dy[i]

            if (0 > newFireX) || (newFireX >= R) || (newFireY < 0) || (newFireY >= C) { continue }

            if map[newFireX][newFireY] != "." { continue }

            map[newFireX][newFireY] = "F"
            fireQueue.append((newFireX, newFireY))
        }
    }

    let jihoonLeft = jihoon
    jihoon = queue.count

    for index in jihoonLeft..<queue.count {
        let (x, y) = queue[index]

        if ((x == 0) || (y == 0) || (x == R - 1) || (y == C - 1)) {
            isPossible = true
        }

        for i in 0..<4 {

            let nx = x + dx[i]
            let ny = y + dy[i]

            if (0 > nx) || (nx >= R) || (ny < 0) || (ny >= C) || visited[nx][ny] { continue }
            if map[nx][ny] != "." { continue }

            visited[nx][ny] = true
            queue.append((nx, ny))
        }
    }
}

print(isPossible ? time : "IMPOSSIBLE")



