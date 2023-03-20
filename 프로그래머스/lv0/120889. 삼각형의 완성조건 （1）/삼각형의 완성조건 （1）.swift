import Foundation

func solution(_ sides:[Int]) -> Int {
    
    let sortedSides = sides.sorted(by: <)
    
    if sortedSides.last! < sortedSides[0...1].reduce(0,+) {
        return 1
    } else {
        return 2
    }
    
    return 0
}