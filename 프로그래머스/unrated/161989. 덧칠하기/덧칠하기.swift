import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    
    var answer = 0
    var newSection = Set(section)
    
    for district in section {
        if newSection.contains(district) {
            let overlap = Set(district..<(district+m))
            newSection.subtract(overlap)
            answer += 1
        }
        
    }
    
    return answer
}