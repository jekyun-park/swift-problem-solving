//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2023/03/31.
//

import Foundation

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]
var cards = [[Int]]()

for _ in 0..<N {
    cards.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var answer = Int.min

for deck in cards {
    let newDeck = deck.sorted(by: <)
    answer = max(answer, newDeck[0])
}

print(answer)
