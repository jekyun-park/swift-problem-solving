//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/14.
//  BOJ > 7562 > 나이트의 이동

import Foundation

let N = Int(readLine()!)!

let dx = [-2, -1, 1, 2, 2, 1, -1, -2]
let dy = [1, 2, 2, 1, -1, -2, -2, -1]

for _ in 0..<N {

    let l = Int(readLine()!)!
    let now = readLine()!.split(separator: " ").map { Int($0) }
    let destination = readLine()!.split(separator: " ").map { Int($0) }

    func isInRange(_ x: Int, _ y: Int) -> Bool {
        return 0..<l ~= x && 0..<l ~= y
    }

    var queue: [(x: Int, y: Int, count: Int)] = [(now[0]!, now[1]!, 0)]

    var visited = Array(repeating: Array(repeating: false, count: l), count: l)

    visited[now[0]!][now[1]!] = true

    var queueIndex = 0
    var answer: Int = 0

    while queueIndex < queue.count {
        
        if now[0] == destination[0] && now[1] == destination[1] { break }
        
        let (x, y, count) = queue[queueIndex]

        if (x == destination[0] && y == destination[1]) {
            answer = count
            break
        }

        queueIndex += 1
        visited[x][y] = true

        for i in 0..<8 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if !isInRange(nx, ny) { continue }
            if visited[nx][ny] { continue }
            
            visited[nx][ny] = true
            queue.append((nx, ny, count + 1))
        }
    }

    print(answer)
}
