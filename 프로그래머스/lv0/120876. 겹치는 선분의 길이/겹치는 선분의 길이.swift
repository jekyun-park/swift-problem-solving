import Foundation

func solution(_ lines:[[Int]]) -> Int {
    
    var answer = 0
    var elements = Array(repeating:0, count: 201)
    
    for line in lines {        
        for i in line[0]+100..<line[1]+100 {
            elements[i] += 1
        }
    }
    
    return elements.filter { $0 > 1 }.count
}