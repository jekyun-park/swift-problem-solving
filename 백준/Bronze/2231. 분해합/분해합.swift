import Foundation

func getGenerator() -> Int {
    let N = Int(readLine()!)!
    for i in 1..<N {
        var number = i
        var result = i
        
        if (1...10) ~= i  {
            result = 2 * i
        } else {
            while number != 0 {
                result += number % 10
                number /= 10
            }
        }
        if result == N {
            return i
        }
    }
    return 0
}

print(getGenerator())