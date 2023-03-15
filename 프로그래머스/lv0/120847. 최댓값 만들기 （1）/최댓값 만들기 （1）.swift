import Foundation

func solution(_ numbers:[Int]) -> Int {
    let sortedNumbers = numbers.sorted(by:<)
    
    return sortedNumbers[numbers.count-1] * sortedNumbers[numbers.count-2]
}