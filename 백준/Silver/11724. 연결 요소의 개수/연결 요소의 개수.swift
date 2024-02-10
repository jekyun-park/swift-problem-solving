//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2/10/24.
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

let N = file.readInt(), M = file.readInt()
var graph = Array(repeating: [Int](), count: N+1)
var visited = Array(repeating: false, count: N+1)
visited[0] = true

for _ in 0..<M {
  let start = file.readInt(), end = file.readInt()
  graph[start].append(end)
  graph[end].append(start)
}

var answer = 0
var stack = [Int]()

for i in 1...N {

  if visited[i] == true { continue }
  stack.append(i)

  while !stack.isEmpty {
    guard let poped = stack.popLast() else { break }
    
    if !visited[poped] {
      visited[poped] = true
      stack.append(contentsOf: graph[poped])
    }

  }
  answer += 1
}

print(answer)