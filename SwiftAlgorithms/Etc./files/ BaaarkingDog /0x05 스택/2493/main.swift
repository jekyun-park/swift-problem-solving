//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/05/03.
//  BOJ > 2493 > 탑

import Foundation

let N = Int(readLine()!)!
var towers = readLine()!.split(separator: " ").map { Int($0)! }
var answer = Array(repeating: 0, count: N)
var stack = [Int]()


for i in 0..<N {
    
    let top = towers[i]
    
    while !stack.isEmpty && (top > towers[stack.last!]) {
        stack.popLast()
    }
    
    if !stack.isEmpty {
        answer[i] = stack.last! + 1
    }
    
    stack.append(i)
}

print(answer.map { String($0) }.joined(separator: " "))
