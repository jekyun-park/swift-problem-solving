import Foundation

func solution(_ babbling:[String]) -> Int {
    
    let pronunciations = ["aya", "ye", "woo", "ma"]
    var answer = 0
    
    for babble in babbling {
        var babble = babble
        for pronunciation in pronunciations {
            let doubled = String(repeating: pronunciation, count: 2)
            if !babble.contains(doubled) {
                babble = babble.replacingOccurrences(of: pronunciation, with: " ")
            }
        }
        
        if babble.trimmingCharacters(in: .whitespaces).isEmpty { answer += 1 }
    }
    
    return answer
}