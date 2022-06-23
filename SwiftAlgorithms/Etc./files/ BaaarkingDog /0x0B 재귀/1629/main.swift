//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/17.
//  BOJ > 1629 > 곱셈

import Foundation

let abc = readLine()!.split(separator: " ").map { Int($0)! }
let A = abc[0], B = abc[1], C = abc[2]

// a를 b번 곱한 수를 C로 나눈 나머지를 구하여라

func multiply(_ a: Int, _ b: Int, _ c: Int) -> Int {
    // base condition
    if b == 1 { return a % c }
    var value = multiply(a, b / 2, c)
    value = value * value % c
    if b % 2 == 0 { return value }
    return value * a % c
}

print(multiply(A, B, C))


