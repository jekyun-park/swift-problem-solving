import Foundation

func solution(_ gems:[String]) -> [Int] {
    let n = gems.count
    let gemCount = Set(gems).count
    
    if gemCount == 1 {
        return [1,1]
    }
    
    var dict = [String: Int]()
    var start = 0
    var end = 1
    var answer = [0, 999_999_999]
    
    
    while end <= n {
        
        let last = gems[end - 1]
        
        if dict[last] == nil {
            
            dict[last] = end - 1
            
            if dict.count == gemCount {
                
                while start < end {
                    let first = gems[start]
                    
                    if dict[first]! == start {
                        break
                    }
                    start += 1
                }
                
                if (answer[1] - answer[0]) > (end - start) {
                    answer = [start, end]
                }
                
                dict.removeValue(forKey: gems[start])
                start += 1
            }
            
        } else {
                dict[last] = end - 1
        }
        
        end += 1    
        
    }
    
    return [answer[0]+1, answer[1]]
}