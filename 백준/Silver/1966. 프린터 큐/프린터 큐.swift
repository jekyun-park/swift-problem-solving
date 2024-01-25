import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
  let NM = readLine()!.split(separator: " ").map { Int($0)! }
  let M = NM.last!

  let docs = readLine()!.split(separator: " ").map { Int($0)! }
  var queue = [(index: Int, priority: Int)]()

  for (index, priority) in docs.enumerated() { queue.append((index, priority)) }

  var answer = 0

  while !queue.isEmpty {
    guard let frontPriority = queue.first?.priority else { break }
    if queue[1...].contains(where: { $0.priority > frontPriority }) {
      queue.append(queue.removeFirst())
    } else {
      let dequeued = queue.removeFirst()
      answer += 1
      if dequeued.index == M { break }
    }
  }
  print(answer)
}