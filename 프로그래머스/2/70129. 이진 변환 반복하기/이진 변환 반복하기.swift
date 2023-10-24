import Foundation

func solution(_ s:String) -> [Int] {
    
    var s = s
    var count = 0
    var zeroCount = 0
    
    while s != "1" {
        var temp = ""
        for character in s {
            if character == "0" {
                zeroCount += 1
            } else {
                temp += String(character)
            }
        }
        s = String(temp.count, radix: 2)
        count += 1
    }
    
    return [count, zeroCount]
}