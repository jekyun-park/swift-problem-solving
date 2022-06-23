//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/17.
//  BOJ > 11729 > 하노이 탑 이동 순서

import Foundation

let N = Int(readLine()!)!

func hanoi(_ n: Int, _ start: Int, _ aux: Int, _ end: Int) {
    if n == 1 { print(start, end); return }
    hanoi(n - 1, start, end, aux)
    hanoi(1, start, aux, end)
    hanoi(n - 1, aux, start, end)
}

print(pow(2, N) - 1)
hanoi(N, 1, 2, 3)
