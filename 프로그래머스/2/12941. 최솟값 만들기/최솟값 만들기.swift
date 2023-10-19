import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int {
    
    let n = A.count - 1

    var lhs = 0
    var rhs = 0
    
    let aSorted = A.sorted(by: <)
    let bSorted = B.sorted(by: >)
    
    for (index, (a, b)) in zip(aSorted, bSorted).enumerated() {
        lhs += a * b
        rhs += aSorted[n-index] * bSorted[n-index]
    }

    return min(lhs, rhs)
}