//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/30.
//  BOJ > 1806 > 부분합

import Foundation

let NS = readLine()!.split(separator: " ").map { Int($0)! }
let N = NS[0], S = NS[1]
let array = readLine()!.split(separator: " ").map { Int($0)! }
var answer = Int.max
var cursor = 0
var sum = 0

for i in 0..<N {
    while sum < S && cursor < N  {
        sum += array[cursor]
        cursor += 1
    }
    if sum >= S {
        answer = min(answer, abs(cursor - i))
    }
    sum -= array[i]
}

answer == Int.max ? print(0) : print(answer)
