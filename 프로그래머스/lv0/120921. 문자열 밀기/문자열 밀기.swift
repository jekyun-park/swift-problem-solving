import Foundation

func solution(_ A:String, _ B:String) -> Int {
    
    if A == B { return 0 }
    var a = A
    
    for i in 0..<A.count {
        a = rotateString(a)
        if a == B {
            return i+1
        }
    }
    
    return -1
}

func rotateString(_ string: String) -> String {
    
    var string = string.map { String($0) }.joined()
    let last = string.popLast()!
    string = String(last) + string
    
    return string
}