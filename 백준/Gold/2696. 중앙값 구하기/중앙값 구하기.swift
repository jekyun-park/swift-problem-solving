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

for _ in 0..<T {
  let M = file.readInt()
  var array = [Int]()
  var midArray = [Int]()
  var line = 0
  var answer = ""

  for _ in 0..<M {
    let input = file.readInt()
    array.append(input)
    if array.count % 2 == 1 {
      array.sort(by: <)
      midArray.append(array[array.count/2])
    }
  }

  print(midArray.count)

  for i in 0..<midArray.count {
    if (i != 0) && (i % 10 == 0) {
      answer += "\n"
    }
    answer += String(midArray[i]) + " "
  }

  print(answer)
}