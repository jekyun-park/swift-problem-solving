import Foundation

func solution(_ n:Int, _ numList:[Int]) -> [Int] {
    return numList.filter { $0 % n == 0 }
}