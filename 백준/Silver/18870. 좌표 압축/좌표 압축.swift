import Foundation

func binarySearch(_ array: [Int], value: Int) -> Int? {
  var start = 0, end = array.count-1
  while (start<=end) {
    let mid = (start+end)/2
    if array[mid] == value { return mid }
    else if array[mid] > value {
      end = mid-1
    } else {
      start = mid+1
    }
  }
  return nil
}

let N = Int(readLine()!)!

let X = readLine()!.split(separator: " ").map { Int(String($0))! }
let sortedX = Array(Set(X)).sorted()

for element in X {
  let index = binarySearch(sortedX, value: element)! // index 출력
  print(index, terminator: " ")
}