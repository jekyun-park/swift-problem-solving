//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/01/18.
//  BOJ 1926 그림 -> BFS (바킹독)

import Foundation


let mapSize = readLine()!.split(separator: " ").map { Int($0)! }
let n = mapSize[0], m = mapSize[1]
var map: [[Int]] = []

let dx: [Int] = [1, -1, 0, 0]
let dy: [Int] = [0, 0, 1, -1]

var visited: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
var que: [(Int, Int)] = []

var maximumOfPicture: Int = 0
var numberOfPicture: Int = 0

for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}


for i in 0..<n {
    for j in 0..<m {
        if (map[i][j] == 0 || visited[i][j] == 1) { continue }
        
        // 점 하나를 큐에 넣는다.
        
        numberOfPicture += 1
        que.append((i, j))
        visited[i][j] = 1
        var pictureArea: Int = 0

        while !que.isEmpty {
            pictureArea += 1
            let (x, y) = que.removeFirst()
            for i in 0..<4 {
                let nx = x + dx[i] ; let ny = y + dy[i]
                if (nx < 0 || nx >= n || ny < 0 || ny >= m) { continue }
                if (map[nx][ny] != 1 || visited[nx][ny] == 1) { continue }
                que.append((nx, ny))
                visited[nx][ny] = 1
            }
        }
        maximumOfPicture = max(maximumOfPicture, pictureArea)
    }
}



print(numberOfPicture)
print(maximumOfPicture)
