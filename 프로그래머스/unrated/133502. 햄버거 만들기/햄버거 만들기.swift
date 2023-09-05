import Foundation

func solution(_ ingredient:[Int]) -> Int {
    
    var ingredient = ingredient
    var index = 0
    var answer = 0
    
    while index < ingredient.count - 3 {
        
        if ingredient[index...(index+3)] == [1, 2, 3, 1] {
            
            ingredient.removeSubrange(index..<(index+4))
            answer += 1
            
            if index < 4 {
                index = 0
            } else {
                index -= 3
            }
            
        } else {
            index += 1
        }
        
    }
    
    
    return answer
}