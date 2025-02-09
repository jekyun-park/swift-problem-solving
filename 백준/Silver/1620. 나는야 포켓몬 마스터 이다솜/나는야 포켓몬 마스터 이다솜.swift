import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var intToString: [Int: String] = [:]
var stringToInt: [String: Int] = [:]

for i in 1...n {
    let name = readLine()!
    intToString[i] = name
    stringToInt[name] = i
}

for _ in 0..<m {
    let request = readLine()!
    
    if let number = Int(request) {
        print(intToString[number]!)
    } else {
        print(stringToInt[request]!)
        
    }
}