import Foundation

func solution(_ n:Int) -> Int {
    var answer = 0
    for i in 1...n {
        var count = 0
        for j in 1...i {
            if i % j == 0 { count += 1 }
        }        
        if count >= 3 { answer += 1 }
    }
    
    return answer
}