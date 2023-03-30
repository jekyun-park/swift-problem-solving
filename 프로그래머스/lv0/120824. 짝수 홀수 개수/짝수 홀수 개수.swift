import Foundation

func solution(_ numList:[Int]) -> [Int] {
    let evenCount = numList.filter { $0 % 2 == 0 }.count
    return [evenCount, numList.count-evenCount]
}