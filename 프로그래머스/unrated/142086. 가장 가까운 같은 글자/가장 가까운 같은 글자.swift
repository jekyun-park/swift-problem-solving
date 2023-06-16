import Foundation

func solution(_ s:String) -> [Int] {
    
    var answer = [Int]()
    let stringArray = Array(s)
    
    for (index, value) in stringArray.enumerated() {
        let first = stringArray.firstIndex(of: value)!
        if index == first {
            answer.append(-1)
        } else {
            let previous = stringArray[..<index].lastIndex(where: { $0 == value })!
            answer.append(index-previous)
        }
    }
    
    return answer
}