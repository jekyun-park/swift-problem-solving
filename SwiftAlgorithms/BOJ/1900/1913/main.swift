//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/07/01.
//  BOJ > 1913 > 달팽이

import Foundation

let N = Int(readLine()!)!
let number = Int(readLine()!)!

var map = Array(repeating: Array(repeating: 0, count: N), count: N)

let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]
var vectorIndex = 0

var position = (x: N / 2, y: N / 2, value: 1)
var limit = 1

while true {
    for _ in 0..<limit {
        map[position.x][position.y] = position.value
        position.x -= 1
        position.value += 1
    }

    if position.value-1 == N * N { break }

    for _ in 0..<limit {
        map[position.x][position.y] = position.value
        position.y += 1
        position.value += 1
    }
    
    limit += 1
    for _ in 0..<limit {
        map[position.x][position.y] = position.value
        position.x += 1
        position.value += 1
    }

    for _ in 0..<limit {
        map[position.x][position.y] = position.value
        position.y -= 1
        position.value += 1
    }
    
    limit += 1
}

var answer = [0,0]

for i in 0..<map.count {
    for j in 0..<map[i].count {
        if map[i][j] == number {
            answer[0] = i
            answer[1] = j
        }
    }
}

for i in 0..<map.count {
    var temp = ""
    for j in map[i].indices {
        temp += "\(map[i][j]) "
    }
    print(temp)
}
print(answer[0]+1,answer[1]+1)

