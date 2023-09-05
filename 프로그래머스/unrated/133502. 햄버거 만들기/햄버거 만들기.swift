import Foundation

func solution(_ ingredient:[Int]) -> Int {
    
    var stack = [Int]()
    var answer = 0
    
    for number in ingredient {
        stack.append(number)
        
        let burger = stack.suffix(4)
        
        if burger == [1, 2, 3, 1] {
            stack.removeLast(4)
            answer += 1
        }
    }
    
    return answer
}