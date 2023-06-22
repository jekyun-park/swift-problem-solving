import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    
    let points: [Int] = Array(1...number).map { countDivisor($0) }
    let filteredPoints: [Int] = points.map { $0 > limit ? power : $0 }
    
    return filteredPoints.reduce(0,+)
}

func countDivisor(_ number: Int) -> Int {
    var divisors = Set<Int>()
    
    let squareRoot = Int(sqrt(Double(number)))
    
    for i in 1...squareRoot {
        if number % i == 0 { 
            divisors.insert(i)
            divisors.insert(number/i)
        }
    }
    
    return divisors.count
}