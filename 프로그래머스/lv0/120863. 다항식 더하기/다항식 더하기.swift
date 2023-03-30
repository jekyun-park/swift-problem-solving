import Foundation

func solution(_ polynomial:String) -> String {
    
    var coefficient = 0
    var constant = 0
    
    let filtered = polynomial.split(separator: " ").filter { $0 != "+" }
    
    let coefficients = filtered.filter { $0.contains("x") }

    for variable in coefficients {
        let splitted = variable.split(separator: "x")
        if splitted.isEmpty {
            coefficient += 1
        } else {
            coefficient += Int(splitted.first!)!
        }
    }

    constant = filtered.filter { !$0.contains("x") }.map { Int($0)! }.reduce(0,+)
    
    if constant == 0 {
        return coefficient == 1 ? "x" : "\(coefficient)x"
    } else if coefficient == 0 {
        return "\(constant)"
    } else {
        return coefficient == 1 ? "x + \(constant)" : "\(coefficient)x + \(constant)"
    }
}