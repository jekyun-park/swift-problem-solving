import Foundation

let n = Int(readLine()!)!
let pattern = readLine()!.split(separator: "*")
let prefix = pattern.first!, suffix = pattern.last!

for _ in 0..<n {
    let fileName = readLine()!
    if prefix.count + suffix.count > fileName.count {
        print("NE")
    } else {
        if fileName.hasPrefix(prefix), fileName.hasSuffix(suffix) {
            print("DA")
        } else {
            print("NE")
        }
    }
}