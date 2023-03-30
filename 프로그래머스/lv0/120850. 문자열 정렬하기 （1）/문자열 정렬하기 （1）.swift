import Foundation

func solution(_ myString:String) -> [Int] {
    return Array(myString.filter { $0.isNumber }).map { Int(String($0))! }.sorted(by: <)
}