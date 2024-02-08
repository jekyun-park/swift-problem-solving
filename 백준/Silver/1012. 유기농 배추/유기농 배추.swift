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
let T = file.readInt()
let dx = [1, -1, 0, 0]
let dy = [0, 0, -1, 1]


for _ in 0..<T {

  func dfs(_ x: Int, _ y: Int) {
    if map[x][y] == 0 { return }

    map[x][y] = 0
    count += 1

    for i in 0..<4 {
      let nx = x + dx[i]
      let ny = y + dy[i]

      guard 0..<map.count ~= nx && 0..<map[0].count ~= ny else { continue }
      dfs(nx, ny)
    }

  }

  let M = file.readInt(), N = file.readInt(), K = file.readInt()
  var map = Array(repeating: Array(repeating: 0, count: M), count: N)
  var count = 0
  var answer = 0

  for _ in 0..<K {
    let x = file.readInt(), y = file.readInt()
    map[y][x] = 1
  }

  for i in 0..<N {
    for j in 0..<M {
      dfs(i, j)
      if count > 0 { answer += 1 }
      count = 0
    }
  }

  print(answer)
}