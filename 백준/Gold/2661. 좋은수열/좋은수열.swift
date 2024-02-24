import Foundation

let n = Int(readLine()!)!
var arr = [Int](repeating: 0, count: 82)
var done = false

func check(_ len: Int) -> Bool {
    for i in 2..<len {
        for j in 1...(len-i) {
            var temp = 0
            for k in j..<j+i {
                if k+i > len+1 {
                    break
                }
                if arr[k] == arr[k+i] {
                    temp += 1
                }
            }
            if temp == i {
                return false
            }
        }
    }
    return true
}

func solution(_ len: Int) {
    if len == n {
        if !done {
            done = true
            for i in 1...len {
                print(arr[i], terminator: "")
            }
            exit(0)
        }
    }

    for i in 1...3 {
        if arr[len] == i {
            continue
        }
        arr[len+1] = i
        if len < 2 || check(len) {
            solution(len+1)
        }

    }
}

solution(0)