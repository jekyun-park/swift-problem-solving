import Foundation

func solution(_ myString:String) -> Int {
    return myString.filter { $0.isNumber }.map { Int(String($0))! }.reduce(0,+)
}