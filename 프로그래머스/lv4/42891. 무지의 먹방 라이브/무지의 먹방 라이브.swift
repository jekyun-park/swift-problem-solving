import Foundation

func solution(_ foodTimes:[Int], _ k:Int64) -> Int {
    
    var foods = [(Int, Int)]()
    var n = foodTimes.count
    var k = k
    
    for i in 0..<n {
        foods.append((foodTimes[i], i+1))
    }
    
    foods.sort { $0.0 < $1.0 }
    
    var pretime = 0
    
    for (index, food) in foods.enumerated() {
        
        let diff = food.0 - pretime
        
        if diff != 0 {
            let spend = diff * n
            
            if spend <= k {
                k -= Int64(spend)
                pretime = food.0
            } else {
                k %= Int64(n)
                let sublist = foods[index...].sorted { $0.1 < $1.1 }
                return sublist[Int(k)].1
            }
        }
        
        n -= 1
    }

    return -1
}