import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    
    var answer = 0
    var dictionary: [String: Int] = [:]
    var discountDictioanry: [String: Int] = [:]
    
    for (a, b) in zip(want, number) {
        dictionary[a] = b
        discountDictioanry[a] = 0
    }
    
    if Set(discount).intersection(Set(want)).count == 0 { return 0 } else {
        for i in 0..<discount.count {
            
            if i+9 > discount.count-1 {
                for item in discount[i...] {
                    if discountDictioanry[item] != nil {
                        discountDictioanry[item]! += 1
                    } 
                }
            } else {
                for item in discount[i...i+9] {
                    if discountDictioanry[item] != nil {
                        discountDictioanry[item]! += 1
                    } 
                }
            }
            
            if discountDictioanry == dictionary { answer += 1 }
            
            discountDictioanry = [:]
            for item in want {
                discountDictioanry[item] = 0
            }
        }
    }
    
    return answer
}