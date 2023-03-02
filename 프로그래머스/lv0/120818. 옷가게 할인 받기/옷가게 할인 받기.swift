import Foundation

func solution(_ price:Int) -> Int {
    var answer = Double(price)
    
    if 100000 <= price && price < 300000 {
        return Int(answer * 0.95)
    } else if 300000 <= price && price < 500000 {
        return Int(answer * 0.9)
    } else if price >= 500000 {
        return Int(answer * 0.8)
    } else {
        return Int(answer)
    }
    
}