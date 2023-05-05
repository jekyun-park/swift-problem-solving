import Foundation

func hash(_ n: String, _ times: Int) -> Int {
    
    return (Int(UnicodeScalar(n)!.value)-96) * Int(pow(31, Double(times)))
}

let n = Int(readLine()!)!
let string = readLine()!.map { String($0) }
var answer = 0

for (index, value) in string.enumerated() {
    
    answer += hash(value, index) % 1234567891
    
}

print(answer)