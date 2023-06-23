import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    
    var keyDictionary: [String: Int] = [:]
    var answer = [Int]()
    
    for key in keymap {
        let keys = Array(key).map { String($0) }
        for i in keys.indices {
            if let value = keyDictionary[keys[i]] {
                keyDictionary[keys[i]] = min(i+1, value)
            } else {
                keyDictionary[keys[i]] = i+1
            }
        }
    }
    
    for target in targets {        
        var count = 0
        var isPossible = true
        let targetArray = Array(target).map { String($0) }
        for letter in  targetArray {
            if let value = keyDictionary[letter] {
                count += value
            } else {
                isPossible = false
                break
            }
        }
        isPossible ? answer.append(count) : answer.append(-1)
    }
    
    return answer
}