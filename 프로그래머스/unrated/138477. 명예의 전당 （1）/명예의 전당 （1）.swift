import Foundation

func solution(_ k:Int, _ scores:[Int]) -> [Int] {
    
    var ranks = [Int]()
    var answer = [Int]()
    
    for score in scores {
        
        if ranks.count < k {
            ranks.append(score)
            ranks.sort(by:>)
        } else {
            if ranks.last! < score {
                ranks.removeLast()
                ranks.append(score)
                ranks.sort(by:>)
            }
        } 
        answer.append(ranks.last!)
    }
    
    return answer
}