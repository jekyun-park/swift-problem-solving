import Foundation

func solution(_ n: Int) -> Int {
    
    let oneCount = String(n, radix: 2).filter { $0 == "1" }.count
    var number = n + 1
    
    while true {
        let count = String(number, radix: 2).filter { $0 == "1" }.count
        if oneCount != count {
            number += 1
        } else {
            break
        }
    }
    
    return number
}