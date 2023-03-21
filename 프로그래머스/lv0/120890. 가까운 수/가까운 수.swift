import Foundation

func solution(_ array:[Int], _ n:Int) -> Int {
    
    var closestNumber: (index: Int, number: Int) = (0, Int.max)
    
    for (index, number) in array.enumerated() {
        if abs(n-number) < abs(n-closestNumber.number) {
            closestNumber.index = index
            closestNumber.number = array[index]
        } else if abs(n-number) == abs(n-closestNumber.number) {
            if number < closestNumber.number {
                closestNumber.index = index
                closestNumber.number = array[index]
            }
        }
    }
    
    return closestNumber.number
}