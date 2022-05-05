//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/05/03.
//  BOJ > 10773 > 제로

import Foundation

var stack = [Int]()

let K = Int(readLine()!)!

for _ in 0..<K {
    let number = Int(readLine()!)!
    if number == 0 { stack.popLast() }
    else { stack.append(number) }
}

print(stack.reduce(0,+))
