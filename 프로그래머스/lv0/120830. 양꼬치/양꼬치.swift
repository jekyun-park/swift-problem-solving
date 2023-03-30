import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    
    let drinkCount = n/10

    return n * 12000 + (k-drinkCount) * 2000
}