import Foundation

func solution(_ number:[Int]) -> Int {
    
    let count = number.count
    var answer = 0
    
    for i in 0..<count-2 {
        for j in (i+1)..<count-1 {
            for k in (j+1)..<count {
                if number[i] + number[j] + number[k] == 0 {
                    answer += 1
                }
            }
        }
    }
    
    return answer
}