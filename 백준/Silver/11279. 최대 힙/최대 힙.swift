import Foundation

struct MaxHeap<Element: Comparable> {
    private var elements: [Element] = []

    var isEmpty: Bool {
        return elements.isEmpty
    }

    var count: Int {
        return elements.count
    }

    func peek() -> Element? {
        return elements.first
    }

    mutating func insert(_ value: Element) {
        elements.append(value)
        siftUp(from: elements.count - 1)
    }

    mutating func remove() -> Element? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, count - 1)
        let removedValue = elements.removeLast()
        siftDown(from: 0)
        return removedValue
    }

    private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }

    private func leftChildIndex(of index: Int) -> Int {
        return 2 * index + 1
    }

    private func rightChildIndex(of index: Int) -> Int {
        return 2 * index + 2
    }

    private mutating func siftUp(from index: Int) {
        var childIndex = index
        var parentIndex = self.parentIndex(of: childIndex)
        while childIndex > 0 && elements[childIndex] > elements[parentIndex] {
            elements.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = self.parentIndex(of: childIndex)
        }
    }

    private mutating func siftDown(from index: Int) {
        var parentIndex = index
        while true {
            let leftChildIndex = self.leftChildIndex(of: parentIndex)
            let rightChildIndex = self.rightChildIndex(of: parentIndex)
            var candidateIndex = parentIndex
            if leftChildIndex < count && elements[leftChildIndex] > elements[candidateIndex] {
                candidateIndex = leftChildIndex
            }
            if rightChildIndex < count && elements[rightChildIndex] > elements[candidateIndex] {
                candidateIndex = rightChildIndex
            }
            if candidateIndex == parentIndex {
                return
            }
            elements.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }
}


let N = Int(readLine()!)!
var heap = MaxHeap<Int>()

for _ in 0..<N {
  let input = Int(readLine()!)!

  if input == 0 {
    print(heap.remove() ?? 0)
  } else {
    heap.insert(input)
  }

}