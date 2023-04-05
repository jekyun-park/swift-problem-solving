import Foundation

func solution(_ score:[[Int]]) -> [Int] {
    
    let average = score.map { (Double($0[0]) + Double($0[1])) / 2 }
    let sortedAverage = average.sorted(by: >)
    let answer = score.flatMap { 
        sortedAverage.firstIndex(of:(Double($0[0]) + Double($0[1])) / 2 )! + 1 
    }
    
    return answer
}