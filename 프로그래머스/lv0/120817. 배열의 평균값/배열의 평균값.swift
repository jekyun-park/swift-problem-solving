import Foundation

func solution(_ numbers:[Int]) -> Double { Double(numbers.reduce(0,+)) / Double(numbers.count) }