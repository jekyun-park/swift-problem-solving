//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/18.
//  BOJ > 15649 > N 과 M (1)

import Foundation


// 자연수 N과 M이 주어졌을 때, 아래 조건을 만족하는 길이가 M인 수열을 모두 구하는 프로그램을 작성하시오.
// 1부터 N까지 자연수 중에서 중복 없이 M개를 고른 수열

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]

var array: [Int] = Array(repeating: 0, count: 10)
var isUsed = Array(repeating: false, count: 10)

func nm(_ k: Int) {
    if k == M {
        for i in 0..<M {
            print(array[i], terminator: " ")
        }
        print("\n")
        return
    }

    for i in 1...N {
        if !isUsed[i] {
            array[k] = i
            isUsed[i] = true
            nm(k + 1)
            isUsed[i] = false
        }
    }

}

print(nm(0))

