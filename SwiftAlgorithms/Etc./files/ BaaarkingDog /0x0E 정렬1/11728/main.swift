//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/23.
//

import Foundation

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

let N = file.readInt()
let M = file.readInt()

var A: [Int] = []
var B: [Int] = []

for _ in 0..<N {
    A.append(file.readInt())
}

for _ in 0..<M {
    B.append(file.readInt())
}

var answer: String = ""

var aIndex = 0, bIndex = 0

for _ in 0..<N + M {
    if bIndex == M {
        answer += "\(A[aIndex]) "
        aIndex += 1
    } else if aIndex == N {
        answer += "\(B[bIndex]) "
        bIndex += 1 
    } else if A[aIndex] <= B[bIndex] {
        answer += "\(A[aIndex]) "
        aIndex += 1
    } else {
        answer += "\(B[bIndex]) "
        bIndex += 1
    }
}

print(answer)
