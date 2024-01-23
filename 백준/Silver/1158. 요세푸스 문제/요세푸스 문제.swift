import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input.first!, K = input.last!

var people = Array(1...N)
var count = K
var order: [Int] = []


while !people.isEmpty {
  if count > people.count {
    count -= people.count
  } else {
    order.append(people.remove(at: count-1))
    count += K-1
  }
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