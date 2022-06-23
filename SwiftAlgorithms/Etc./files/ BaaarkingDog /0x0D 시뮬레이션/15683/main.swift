//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/22.
//  BOJ > 15683 > 감시

import Foundation

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]
var map: [[Int]] = []

for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

// 사각지대의 최소크기를 구하는 문제이므로, CCTV가 최대한 많이 감시할 수 있도록 하는 경우를 찾아보자
let moveDictionary: [Int: [[(Int, Int)]]] = [1: [[(-1, 0)], [(1, 0)], [(0, -1)], [(0, 1)]], 2: [[(0, -1), (0, 1)], [(1, 0), (-1, 0)]], 3: [[(-1, 0), (0, 1)], [(0, 1), (1, 0)], [(1, 0), (0, -1)], [(0, -1), (-1, 0)]], 4: [[(0, 1), (0, -1), (0, 1)], [(0, 1), (-1, 0), (1, 0)], [(0, 1), (1, 0), (0, -1)], [(1, 0), (0, -1), (-1, 0)]], 5: [[(-1, 0), (1, 0), (0, -1), (0, 1)]]]

var camera: [(Int, Int)] = []

func isInRange(_ x: Int, _ y: Int) -> Bool {
    return 0..<N ~= x && 0..<M ~= y
}

for i in 0..<N {
    for j in 0..<M {
        if map[i][j] == 0 || map[i][j] == 6 { continue }
        else { camera.append((i, j)) }
    }
}


for (x,y) in camera {
    
    moveDictionary[map[x][y]]!.forEach {
        
        $0.forEach {
            let nx = x + $0.0
            let ny = y + $0.1
            if !isInRange(nx, ny) { continue }
        }
        
        
    }
    
    
}
