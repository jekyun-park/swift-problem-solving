import Foundation

func solution(_ chicken:Int) -> Int {
    
    var chickenCount = chicken
    
    // 주문한 서비스 치킨의 수
    var answer = 0
    
    while true {
        
        let quotient = chickenCount / 10
        let remainder = chickenCount % 10
        
        answer += quotient
        
        chickenCount = (quotient + remainder)
        
        if quotient == 0 { break }
    }
    
    return answer
}