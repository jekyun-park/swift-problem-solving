import Foundation

func solution(_ numbers:[Int], _ k:Int) -> Int {
    
    let index = (2 * (k-1)) % numbers.count
    
    return numbers[index]
}