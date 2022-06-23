//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/23.
//

import Foundation

// 정렬할 배열

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

var array: [Int] = []

let file = FileIO()
let N = file.readInt()

for _ in 0..<N {
    array.append(file.readInt())
}

var tmp: [Int] = [Int](repeating: 0, count: array.count)

func merge(_ start: Int, _ end: Int) {
    let mid = (start + end) / 2
    var leftIndex = start, rightIndex = mid

    for i in start..<end {
        if rightIndex == end {
            tmp[i] = array[leftIndex]
            leftIndex += 1
        } else if leftIndex == mid {
            tmp[i] = array[rightIndex]
            rightIndex += 1
        } else if array[leftIndex] <= array[rightIndex] {
            tmp[i] = array[leftIndex]
            leftIndex += 1
        } else {
            tmp[i] = array[rightIndex]
            rightIndex += 1
        }
    }

    for i in start..<end {
        array[i] = tmp[i]
    }
}

func mergeSort(_ start: Int, _ end: Int) {
    if end == start + 1 { return }
    let mid = (start + end) / 2
    mergeSort(start, mid)
    mergeSort(mid, end)
    merge(start, end)
}

mergeSort(0, array.count)

for i in 0..<array.count {
    print(array[i],terminator: " ")
}

