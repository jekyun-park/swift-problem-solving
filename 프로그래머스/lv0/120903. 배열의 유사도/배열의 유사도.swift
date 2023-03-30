import Foundation

func solution(_ s1:[String], _ s2:[String]) -> Int {
    return s1.filter { s2.contains($0) }.count
}