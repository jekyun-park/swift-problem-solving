//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/05/04.
//  BOJ > 18258 > 큐

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

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}

let file = FileIO()
var queue = Queue()
var N = file.readInt()

while N>0 {
    let command = file.readString()
    if command == "push" {
        let num = file.readInt()
        queue.push(num)
    } else if command == "pop" {
        print(queue.popFirst())6
        
    } else if command == "size" {
        print(queue.size)
    } else if command == "empty" {
        print(queue.isEmpty ? 1 : 0)
    } else if command == "front" {
        print(queue.front)
    } else if command == "back" {
        print(queue.back)
    }
    N -= 1
}
