//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 박제균 on 2022/05/05.
//  BOJ > 2164 > 카드2

import Foundation

let N = Int(readLine()!)!

var cards = [Int](1...N)

struct Queue {
    var queue: [Int] = []
    var head = 0

    var isEmpty: Bool {
        return head >= queue.count
    }
    var count: Int {
        return queue.count - head + 1
    }
    var back: Int {
        return queue[queue.count-1]
    }
    mutating func push(_ n: Int) {
        queue.append(n)
    }

    mutating func popFirst() -> Int {
        let result = queue[head]
        head += 1
        return result
    }
}

var queue = Queue()
for i in 1...N { queue.push(i) }

while true {
    queue.popFirst()
    if queue.count == 1 { break }
    let number = queue.popFirst()
    queue.push(number)
}

print(queue.back)
