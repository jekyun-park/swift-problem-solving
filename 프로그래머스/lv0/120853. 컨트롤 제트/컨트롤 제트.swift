import Foundation

func solution(_ s:String) -> Int {
    
    var stack = [Int]()
    let numbers = s.split(separator: " ")
    
    for number in numbers {
        if let newNumber = Int(number) { 
            stack.append(newNumber)
        } else {
            stack.popLast()
        }
    }
    
    return stack.reduce(0,+)
}