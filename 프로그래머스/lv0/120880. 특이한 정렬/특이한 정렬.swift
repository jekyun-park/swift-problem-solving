import Foundation

func solution(_ numList:[Int], _ n:Int) -> [Int] {
    
    var answer = numList.sorted { 
        if abs(n-$0) == abs(n-$1) {
            return $0 > $1
        } else {
            return abs(n-$0) < abs(n-$1)
        }
    }
    
    return answer
}