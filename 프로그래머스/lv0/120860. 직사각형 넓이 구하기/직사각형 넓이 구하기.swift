import Foundation

func solution(_ dots:[[Int]]) -> Int {
    let sortedDots = dots.sorted{ ($0[1] < $1[1]) }
    let width = abs(sortedDots[1][0] - sortedDots[0][0])
    let height = abs(sortedDots.first![1] - sortedDots.last![1])
    return width * height
}