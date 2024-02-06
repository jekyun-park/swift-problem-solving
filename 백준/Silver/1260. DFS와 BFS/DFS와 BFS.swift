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


struct Queue {
  private var input = [Int]()
  private var cursor = 0

  var isEmpty: Bool {
    input.isEmpty
  }

  mutating func enqueue(element: Int) {
    input.append(element)
  }

  mutating func dequeue() -> Int? {
    guard cursor < input.count else { return nil }

    defer {
      cursor += 1
      if cursor >= 100 && cursor < input.count {
        input = Array(input[cursor..<input.count])
        cursor = 0
      }
    }

    return input[cursor]
  }
}

func dfs(graph: [[Int]], node: Int, visited: inout [Bool]) {
  var stack = [node]

  while !stack.isEmpty {
    guard let poped = stack.popLast() else { return }

    if !visited[poped] {
      visited[poped] = true
      stack.append(contentsOf: graph[poped].reversed())
      answer += "\(poped) "
    }
  }
}

func bfs(graph: [[Int]], node: Int, visited: inout [Bool]) {
  var queue = Queue()
  queue.enqueue(element: node)

  while !queue.isEmpty {
    guard let dequeued = queue.dequeue() else { return }
    visited[dequeued] = true
    answer += "\(dequeued) "

    for node in graph[dequeued] {
      if !visited[node] {
        queue.enqueue(element: node)
        visited[node] = true
      }
    }
  }
}
let file = FileIO()
let N = file.readInt()
let M = file.readInt()
let V = file.readInt()
var answer = ""
var graph: [[Int]] = Array(repeating: [], count: N+1)
var visited = Array(repeating: false, count: N+1)

for _ in 0..<M {
  let start = file.readInt(), dest = file.readInt()
  graph[start].append(dest)
  graph[dest].append(start)
}

graph = graph.map { $0.sorted(by: <) }
dfs(graph: graph, node: V, visited: &visited)
visited = Array(repeating: false, count: N+1)
answer += "\n"
bfs(graph: graph, node: V, visited: &visited)
print(answer)