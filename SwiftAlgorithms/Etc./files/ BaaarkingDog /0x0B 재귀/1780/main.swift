//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/18.
//  BOJ > 1780 > 종이의 개수

import Foundation

var minusOne = 0
var zero = 0
var one = 0
var map: [[Int]] = []

let N = Int(readLine()!)!

for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func countColorPaper(_ n: Int) {

    for i in 0..<n {
        for j in 0..<n {
            map[i][j]
        }
    }


}


countColorPaper(N)

print(minusOne, zero, one)
