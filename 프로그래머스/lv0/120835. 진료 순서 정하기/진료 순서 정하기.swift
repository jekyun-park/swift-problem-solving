import Foundation

func solution(_ emergency:[Int]) -> [Int] {
    
    var answer = [Int]()
    let sorted = emergency.sorted(by:>)
    
    for value in emergency {
        guard let index = sorted.firstIndex(of: value) else { return [] }
        answer.append(index+1)
    }
    
    return answer
}