//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/03/07.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

let N = input[0], X = input[1]

let Array = readLine()!.split(separator: " ").map { Int($0)! }
var answer: [Int] = []

for number in Array {
    if number < X {
        answer.append(number)
    }
}

print((answer).map { String($0) }.joined(separator: " "))
