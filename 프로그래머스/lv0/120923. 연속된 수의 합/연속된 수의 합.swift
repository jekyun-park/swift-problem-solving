import Foundation

func solution(_ num:Int, _ total:Int) -> [Int] {
    
    if total % num == 0 { 
        let quotient = total / num
        return Array((quotient - (num-1)/2)...(quotient+(num-1)/2))
    } else { 
        let quotient = total / num
        return Array((quotient - num/2 + 1)...(quotient + num/2))
    }
}