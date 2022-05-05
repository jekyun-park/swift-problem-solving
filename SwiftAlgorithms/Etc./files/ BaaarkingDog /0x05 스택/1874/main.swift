//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/05/03.
//  BOJ > 1874 > 스택 수열

import Foundation

let N = Int(readLine()!)!
var stack = [Int]()
var operators = [String]()
var count = 1 // 오름차순으로 증가하는 숫자

for _ in 0..<N {
    let number = Int(readLine()!)!
    
    while count <= number {
        stack.append(count)
        operators.append("+")
        count += 1
    }
    
    if stack.last == number {
        stack.popLast()
        operators.append("-")
    } else {
        print("No")
        exit(0)
    }
}

print(operators.joined(separator: "\n"))



