import Foundation

func solution(_ n:Int) -> Int {
    
    var count = 1
    
    while true {
        if (6 * count) % n == 0 {
            break
        } else {
            count += 1
        }
    }
    
    return count
}