//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/05/02.
//

import Foundation

// BOJ 10828 스택

let N = Int(readLine()!)!
var stack = [Int]()

for _ in 0..<N {
    let command = readLine()!.split(separator: " ")
    
    if command.first! == "push" {
        push(Int(command.last!)!)
    } else if command.first! == "pop" {
        pop()
    } else if command.first! == "size" {
        size()
    } else if command.first! == "empty" {
        empty()
    } else if command.first! == "top" {
        top()
    }
}

func push(_ x: Int) {
    stack.append(x)
}

func pop() {
    if stack.isEmpty { print(-1) }
    else { print(stack.popLast()!) }
}

func size() {
    print(stack.count)
}

func empty() {
    print(stack.isEmpty ? 1 : 0)
}

func top() {
    guard let top = stack.last else { return print(-1) }
    print(top)
}
