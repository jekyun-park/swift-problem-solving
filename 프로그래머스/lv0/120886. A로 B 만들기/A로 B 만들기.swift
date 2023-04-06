import Foundation

func solution(_ before:String, _ after:String) -> Int {
    return Array(before).sorted(by: <) == Array(after).sorted(by: <) ? 1 : 0
}