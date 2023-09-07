import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    
    let sortedSizes = sizes.map { $0.sorted(by:>) }
    
    let a = sortedSizes.map { $0[0] }.max()!
    let b = sortedSizes.map { $0[1] }.max()!
    
    return a * b
}