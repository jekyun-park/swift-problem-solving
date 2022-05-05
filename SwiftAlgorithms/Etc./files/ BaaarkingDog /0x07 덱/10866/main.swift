//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/05/05.
//  BOJ > 10866 > 덱

import Foundation

struct Deque {

    var enQueue: [Int]
    var deQueue: [Int] = []

    var count: Int {
        return enQueue.count + deQueue.count
    }

    var isEmpty: Bool {
        return enQueue.isEmpty && deQueue.isEmpty
    }

    var front: Int? {
        if deQueue.isEmpty {
            return enQueue.first
        }
        return deQueue.last
    }

    var back: Int? {
        if enQueue.isEmpty {
            return deQueue.first
        }
        return enQueue.last
    }

    init(_ queue: [Int]) {
        enQueue = queue
    }

    mutating func pushFront(_ n: Int) {
        deQueue.append(n)
    }

    mutating func pushBack(_ n: Int) {
        enQueue.append(n)
    }

    mutating func popFront() -> Int? {
        if deQueue.isEmpty {
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        return deQueue.popLast()
    }

    mutating func popBack() -> Int? {
        var result: Int?
        if enQueue.isEmpty {
            deQueue.reverse()
            result = deQueue.popLast()
            deQueue.reverse()
        } else {
            result = enQueue.popLast()
        }
        return result
    }

    mutating func removeAll() {
        enQueue.removeAll()
        deQueue.removeAll()
    }

}

let N = Int(readLine()!)!
var array: [Int] = []
var deque = Deque(array)

for _ in 0..<N {
    let command = readLine()!.split(separator: " ").map { String($0) }

    if command.first == "push_front" {
        deque.pushFront(Int(command.last!)!)
    } else if command.first == "push_back" {
        deque.pushBack(Int(command.last!)!)
    } else if command.first == "pop_front" {
        deque.isEmpty ? print(-1) : print(deque.popFront()!)
    } else if command.first == "pop_back" {
        deque.isEmpty ? print(-1) : print(deque.popBack()!)
    } else if command.first == "size" {
        print(deque.count)
    } else if command.first == "empty" {
        deque.isEmpty ? print(1) : print(0)
    } else if command.first == "front" {
        deque.isEmpty ? print(-1) : print(deque.front!)
    } else if command.first == "back" {
        deque.isEmpty ? print(-1) : print(deque.back!)
    }
}
