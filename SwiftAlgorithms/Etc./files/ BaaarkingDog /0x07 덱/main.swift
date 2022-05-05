//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/05/05.
//

import Foundation

struct Deque<T> {

    var enQueue: [T]
    var deQueue: [T] = []

    var count: Int {
        return enQueue.count + deQueue.count
    }

    var isEmpty: Bool {
        return enQueue.isEmpty && deQueue.isEmpty
    }

    var front: T? {
        if deQueue.isEmpty {
            return enQueue.first
        }
        return deQueue.last
    }
    
    var back: T? {
        if enQueue.isEmpty {
            return deQueue.first
        }
        return enQueue.last
    }

    init(_ queue: [T]) {
        enQueue = queue
    }

    mutating func pushFront(_ n: T) {
        deQueue.append(n)
    }

    mutating func pushBack(_ n: T) {
        enQueue.append(n)
    }

    mutating func popFront() -> T? {
        if deQueue.isEmpty {
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        return deQueue.popLast()
    }

    mutating func popBack() -> T? {
        var result: T?
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
