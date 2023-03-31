import Foundation

func solution(_ sides:[Int]) -> Int {
    
    let big = max(sides[0], sides[1])
    let small = min(sides[0], sides[1])

    return (big-small+1...big+small-1).count
}