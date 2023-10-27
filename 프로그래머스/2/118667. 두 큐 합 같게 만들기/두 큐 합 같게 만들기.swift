import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    
    let n = queue1.count
    var answer = Int.max
    var queue = queue1 + queue2
    
    let sum = (queue1.reduce(0,+) + queue2.reduce(0,+))
    let target = sum / 2
    
    if sum % 2 != 0 { return -1 }
    
    var end = 0
    var total = queue[0]
    
    for start in 0..<2*n {
        
        while total < target {
            end = (end + 1) % (2*n)
            total += queue[end]
        }
        
        if total == target {
            var moves = 0
            end < n-1 ? (moves = 3*n + 1 + start + end) : (moves = start + (end - n + 1))
            answer = min(moves, answer)
        }
        
        total -= queue[start]
    }
    
    if answer == Int.max { return -1 }
    
    return answer
}