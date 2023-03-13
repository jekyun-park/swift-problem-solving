import Foundation

func solution(_ numbers:[Int], _ direction:String) -> [Int] {

    guard let firstLetter = direction.first else { return [] }
    
    return firstLetter == "r" ? ([numbers[numbers.count-1]] + numbers[...(numbers.count-2)]) : (numbers[1...] + [numbers[0]])
}
