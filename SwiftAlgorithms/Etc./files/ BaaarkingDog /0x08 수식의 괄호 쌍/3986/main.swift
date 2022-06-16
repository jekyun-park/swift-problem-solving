//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/13.
//

import Foundation

let N = Int(readLine()!)!
var answer = 0

for _ in 0..<N {

    let word = Array(readLine()!).map { String($0) }
    var stack: [String] = []
    var isGood = true

    for character in word {
        if stack.isEmpty {
            stack.append(character)
        } else {
            let top = stack.last!
            if top != character {
                stack.append(character)
            } else {
                stack.removeLast()
            }
        }
    }
    if !stack.isEmpty { isGood = false }
    if isGood { answer += 1 }
}

print(answer)
