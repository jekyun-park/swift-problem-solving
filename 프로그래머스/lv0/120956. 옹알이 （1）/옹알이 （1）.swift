import Foundation

func solution(_ babbling:[String]) -> Int {
    
    let pronunciations = ["aya", "ye", "woo", "ma"]
    var answer = 0
    
    for pronunciation in babbling {
       var checkingPronunciation = pronunciation
        for item in pronunciations.reversed() {
            if pronunciation.contains(item) {
                checkingPronunciation = checkingPronunciation.replacingOccurrences(of: item, with: "")
            }
        }
       checkingPronunciation.isEmpty ? (answer += 1) : (answer += 0)
    }
    
    return answer
}