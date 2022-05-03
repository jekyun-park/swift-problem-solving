//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/05/02.
//  BOJ > 10775 > 공항

import Foundation

let G = Int(readLine()!)!
let P = Int(readLine()!)!
var planes = [Int]()
var parent = Array(0...G)

func find(_ n: Int) -> Int {
    if n == parent[n] { return n }
    return find(parent[n])
}

var answer = 0

for _ in 0..<P {
    planes.append(Int(readLine()!)!)
}

for i in planes {
    let p = find(i)
    if p == 0 { break }
    answer += 1
    parent[p] = parent[p-1]
}

print(answer)
