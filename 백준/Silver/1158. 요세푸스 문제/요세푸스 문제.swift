import Foundation

struct Queue<T> {
  init(input: [T]) {
    inputStack = input
  }

  var inputStack: [T] = []
  var outputStack: [T] = []
  var count: Int {
    inputStack.count + outputStack.count
  }
  var isEmpty: Bool {
    inputStack.isEmpty && outputStack.isEmpty
  }

  mutating func enqueue(_ element: T) {
    inputStack.append(element)
  }

  mutating func dequeue() -> T?{
    if outputStack.isEmpty {
      outputStack = inputStack.reversed()
      inputStack.removeAll()
    }
    return outputStack.popLast()
  }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input.first!, K = input.last!

var people = Queue(input: Array(1...N))
var count = 1
var order: [Int] = []

while !people.isEmpty {
  guard let person = people.dequeue() else { break }
  if count % K == 0 {
    order.append(person)
  } else {
    people.enqueue(person)
  }
  count += 1
}

print("<", terminator: "")
for (index, value) in order.enumerated() {
  if index == order.count - 1 {
    print("\(value)", terminator: "")
  } else {
    print("\(value)", terminator: ", ")
  }
}
print(">", terminator: "")