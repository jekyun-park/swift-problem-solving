import Foundation

func solution(_ array:[Int]) -> Int {
    return array.map { String($0).map { String($0) } }.flatMap { $0 }.filter { $0 == "7" }.count
}