import Foundation

func solution(_ a: Int, _ b: Int, _ n: Int) -> Int {
    
    var total = n
    var answer = 0
    
    while true {
        if total < a { break }
        
        let remainder = total % a
        answer += (total/a) * b
        total = remainder + (total/a) * b
    }
    
    
    return answer
}
