//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/04/11.
//

import Foundation

let input = readLine()!
var answer = [Int](repeating: 0, count: 26)
input.forEach {
    answer[Int(((Character(extendedGraphemeClusterLiteral: $0).asciiValue!)))-97] += 1
}
answer.forEach {
    print($0, terminator: " ")
}

