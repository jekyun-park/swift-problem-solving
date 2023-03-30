import Foundation

func solution(_ numberList:[Int], _ n:Int) -> [[Int]] {
    var answer: [[Int]] = []
    var tempArray = [Int]()
    
    for number in numberList {
        if tempArray.count == n {
            answer.append(tempArray)
            tempArray.removeAll()
        }
        tempArray.append(number)
    }
    answer.append(tempArray)
    
    return answer
}