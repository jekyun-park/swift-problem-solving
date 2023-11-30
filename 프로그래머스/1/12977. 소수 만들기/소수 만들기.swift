import Foundation

func solution(_ nums:[Int]) -> Int {
    
    var answer = 0

    let cases = pickThreeNumbers(nums)
    
    for numbers in cases {
        
        let sum = numbers.reduce(0,+)
        
        answer = isPrime(sum) ? (answer + 1) : (answer)
    }

    return answer
}

func pickThreeNumbers(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    if nums.count < 3 { return result }

    func recursion(_ index: Int, _ now: [Int]) {
        if now.count == 3 {
            result.append(now)
            return
        }

        for i in index..<nums.count {
            recursion(i + 1, now + [nums[i]])
        }
    }

    recursion(0,[])

    return result
}

func isPrime(_ n: Int) -> Bool {
    
    let root = Int(sqrt(Double(n)))
    
    for i in 2...root {
        if n % i == 0  {
            return false
        }
    }
    
    return true
}