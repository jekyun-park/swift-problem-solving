import Foundation

func solution(_ numbers:[Int]) -> Int {

    var maximum: Int = Int.min
    
    for i in 0..<numbers.count-1 {
        for j in i+1..<numbers.count {
            maximum = max(maximum, numbers[i] * numbers[j])
        }
    }
    
    return maximum
}