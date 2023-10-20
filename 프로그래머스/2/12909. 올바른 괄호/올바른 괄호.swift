import Foundation

func solution(_ s:String) -> Bool {

    var stack = [Character]()
    
    for character in s {
        if character == "(" {
            stack.append(character)
        } else {
            if stack.isEmpty { return false }
            stack.popLast()!
        }
    }
    
    return stack.isEmpty
}