//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/05/04.
//  BOJ > 10845 > 큐

import Foundation

struct Queue {

    var queue = [Int]()
    var head = 0
    var tail = 0

    var isEmpty: Bool {
        return tail - head == 0
    }

    var front: Int {
        if self.size == 0 { return -1 }
        return queue[head]
    }

    var back: Int {
        if self.size == 0 { return -1 }
        return queue[tail - 1]
    }

    var size: Int {
        return tail-head
    }

    mutating func push(_ n: Int) {
        queue.append(n)
        tail += 1
    }

    mutating func popFirst() -> Int {
        if self.size == 0 { return -1 }
        let result = queue[head]
        head += 1
        return result
    }
}

let N = Int(readLine()!)!

var queue = Queue()

for _ in 0..<N {
    let command = readLine()!.split(separator: " ").map { String($0) }

    if command.count > 1 {
        queue.push(Int(command.last!)!)
    } else {
        if command.first == "front" {
            print(queue.front)
        } else if command.first == "back" {
            print(queue.back)
        } else if command.first == "size" {
            print(queue.size)
        } else if command.first == "empty" {
            print(queue.isEmpty ? 1 : 0)
        } else if command.first == "pop" {
            print(queue.popFirst())
        }
    }
}
