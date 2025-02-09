import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    var dictionary: [String: [String]] = [:]
    
    if n == 0 {
        print(0)
        continue
    }
    
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map { String($0) }
        dictionary[input[1], default: []].append(input[0])
    }
    
    var answer = 1
    
    for array in dictionary {
        answer *= array.value.count + 1
    }
    
    print(answer - 1)
}