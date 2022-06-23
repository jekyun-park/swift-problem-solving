//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/17.
//  BOJ > 1074 > Z

import Foundation

let Nrc = readLine()!.split(separator: " ").map { Int($0)! }
let N = Nrc[0], r = Nrc[1], c = Nrc[2]


func movingZ(_ n: Int, _ r: Int, _ c: Int) -> Int {
    if n == 0 { return 0 }
    let half = 1<<(n-1)
    if (r < (half) && c < (half)) { return movingZ(n - 1, r, c) }
    if r < (half) && c >= half { return half * half + movingZ(n - 1, r, c - half) }
    if r >= half && c < half { return 2*half*half + movingZ(n-1, r-half, c)}
    return 3*half*half + movingZ(n-1, r-half, c-half)
}

print(movingZ(N, r, c))
