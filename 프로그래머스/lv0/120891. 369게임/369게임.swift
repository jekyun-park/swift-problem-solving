import Foundation

func solution(_ order:Int) -> Int {
    return Array(String(order)).filter { $0 == "3" || $0 == "6" || $0 == "9"}.count
}