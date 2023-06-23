import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    
    var score = score
    var answer = 0
    var box = [Int]()
    
    score.sort(by: >)
    
    for (index, value) in score.enumerated() {
        
        box.append(value)
        
        if index % m == m-1 { 
            box.sort(by:<)
            answer += box.first! * m
            box.removeAll()
        }
        
    }
    
    return answer
}