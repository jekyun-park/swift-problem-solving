//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/01/31.
//

import Foundation


let NQ = readLine()!.split(separator: " ").map { Int($0)! }
let N = NQ[0], Q = NQ[1]
let size = Int(pow(Double(2), Double(N)))

var iceBoard: [[Int]] = []

for _ in 0..<size {
    iceBoard.append(readLine()!.split(separator: " ").map { Int($0)! })
}

print(iceBoard)
