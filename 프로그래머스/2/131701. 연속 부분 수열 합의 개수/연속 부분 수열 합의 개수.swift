import Foundation

func solution(_ elements:[Int]) -> Int {
    
    let n = elements.count
    
    var answers = elements
    
    for i in 2...n {
        for j in 0..<n {
            var sum = 0
            for k in 0..<i {
                sum += elements[(j+k)%n]
            }
            answers.append(sum)
        }
    }
    
    return Set(answers).count
}