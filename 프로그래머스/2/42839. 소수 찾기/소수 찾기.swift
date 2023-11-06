import Foundation

func solution(_ numbers:String) -> Int {
    
    let numbers = Array(numbers).map { Int(String($0))! }
    let n = numbers.count
    var answer = 0
    var set = Set<Int>()
    
    for i in 1...n {
        let made = permutation(numbers, i).map { Int($0.map { String($0) }.joined())! }
        made.forEach { set.insert($0) }
    }
    
    set.forEach { if isPrime($0) { answer += 1 } }
    
    return answer
}

func isPrime(_ n: Int) -> Bool {
    
    if n <= 1 { return false }
    
    let root = Int(sqrt(Double(n)))
    
    for i in 2..<(root+1) {
        if n % i == 0 {
            return false
        }
    }
    
    return true
}

func permutation<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }

    var stack: [([T], [Bool])] = array.enumerated().map {
        var visited = Array(repeating: false, count: array.count)
        visited[$0.offset] = true
        return ([$0.element], visited)
    }

    while stack.count > 0 {
        let now = stack.removeLast()

        let elements = now.0
        var visited = now.1

        if elements.count == n {
            result.append(elements)
            continue
        }

        for i in 0...array.count-1 {
            if visited[i] { continue }
            visited[i] = true
            stack.append((elements + [array[i]], visited))
            visited[i] = false
        }
    }

    return result
}