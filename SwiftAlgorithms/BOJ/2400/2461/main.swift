//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/04/03.
//  BOJ > 2461 > 대표 선수

import Foundation

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
var answer = Int.max

var students: [[Int]] = []

for _ in 0..<N {
    students.append(readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <))
}

for i in 0..<M {
    var players: [Int] = []
    students.forEach {
        players.append($0[i])
    }
    answer = min(answer,players.max()! - players.min()!)
}

print(answer)
