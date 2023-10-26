import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    
    var dictionary: [Int: Int] = [:]
    var answer = 0
    var k = k
    
    for gyul in tangerine {
        dictionary[gyul, default: 0] += 1
    }
    
    
    let sorted = dictionary.sorted { 
        $0.value > $1.value
    } 
    
    for (_, value) in sorted {
        answer += 1
        for _ in 0..<value {
            k -= 1
            if k == 0 { 
                return answer
            }
        }
    }
    
    return answer
}