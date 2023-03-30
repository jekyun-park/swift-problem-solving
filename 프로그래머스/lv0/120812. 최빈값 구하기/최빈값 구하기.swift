import Foundation

func solution(_ array:[Int]) -> Int {
    var dict =  [Int: Int]()
    
    for number in array {
        dict[number, default:0] += 1
    }
    
    if let mode = dict.max { $0.value < $1.value } {
        let result = dict.filter { $0.value == mode.value }
        return result.count == 1 ? Array(result.keys)[0] : -1
    }
    return 0
}