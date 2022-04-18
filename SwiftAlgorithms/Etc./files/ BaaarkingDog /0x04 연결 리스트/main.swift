//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/04/13.
//

import Foundation

// BOJ 1406 에디터

var left = readLine()!
let M = Int(readLine()!)!
var right = ""

for _ in 0..<M {
    let command = readLine()!
    switch command {
    case "L":
        if !left.isEmpty { right.append(left.popLast()!) }
    case "D":
        if !right.isEmpty { left.append(right.popLast()!) }
    case "B":
        if !left.isEmpty { left.removeLast() }
    default:
        left.append(command.last!)
    }
}

print(left+right.reversed())
