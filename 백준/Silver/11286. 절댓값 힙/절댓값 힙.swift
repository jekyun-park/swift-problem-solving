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

struct AbsoluteMinHeap {
    private var elements: [Int] = []

    var isEmpty: Bool {
        return elements.isEmpty
    }

    var count: Int {
        return elements.count
    }

    func peek() -> Int? {
        return elements.first
    }

    // Insert with comparison based on absolute values
    mutating func insert(_ value: Int) {
        elements.append(value)
        siftUp(from: elements.count - 1)
    }

    // Remove the number with the smallest absolute value
    mutating func remove() -> Int? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, count - 1)
        let removedValue = elements.removeLast()
        siftDown(from: 0)
        return removedValue
    }

    // Helper functions
    private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }

    private func leftChildIndex(of index: Int) -> Int {
        return 2 * index + 1
    }

    private func rightChildIndex(of index: Int) -> Int {
        return 2 * index + 2
    }

    // Sift up based on absolute value comparison
    private mutating func siftUp(from index: Int) {
        var childIndex = index
        let childValue = elements[childIndex]
        while childIndex > 0 {
            let parentIndex = self.parentIndex(of: childIndex)
            let parentValue = elements[parentIndex]
            // Comparison based on absolute values, with tie-breaker for equal absolute values
            if abs(childValue) < abs(parentValue) || (abs(childValue) == abs(parentValue) && childValue < parentValue) {
                elements[childIndex] = parentValue
                elements[parentIndex] = childValue
                childIndex = parentIndex
            } else {
                break
            }
        }
    }

    // Sift down based on absolute value comparison
    private mutating func siftDown(from index: Int) {
        var parentIndex = index
        while true {
            let leftChildIndex = self.leftChildIndex(of: parentIndex)
            let rightChildIndex = self.rightChildIndex(of: parentIndex)
            var candidateIndex = parentIndex

            if leftChildIndex < count &&
                (abs(elements[leftChildIndex]) < abs(elements[candidateIndex]) ||
                (abs(elements[leftChildIndex]) == abs(elements[candidateIndex]) && elements[leftChildIndex] < elements[candidateIndex])) {
                candidateIndex = leftChildIndex
            }

            if rightChildIndex < count &&
                (abs(elements[rightChildIndex]) < abs(elements[candidateIndex]) ||
                (abs(elements[rightChildIndex]) == abs(elements[candidateIndex]) && elements[rightChildIndex] < elements[candidateIndex])) {
                candidateIndex = rightChildIndex
            }

            if candidateIndex == parentIndex {
                break
            }

            elements.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }
}

let file = FileIO()
let N = file.readInt()
var heap = AbsoluteMinHeap()

for _ in 0..<N {
  let input = file.readInt()
  input == 0 ? (print(heap.remove() ?? 0)) : (heap.insert(input))
}