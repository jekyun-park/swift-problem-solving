import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    
    let n = numbers.count
    var answer = Array(repeating: -1, count: n)
    var stack = [Int]()

    for i in 0..<n {
        while !stack.isEmpty && numbers[stack.last!] < numbers[i] {
            answer[stack.popLast()!] = numbers[i]
        }
        stack.append(i)
    }    
    
    return answer
}