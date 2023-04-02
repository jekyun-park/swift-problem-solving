import Foundation

func solution(_ dots:[[Int]]) -> Int {
    
    for i in 0..<dots.count-1 {
        for j in (i+1)..<dots.count {        
            
            let indices = (0...3).filter { $0 != i && $0 != j }
            let x = abs(dots[i][0] - dots[j][0])
            let y = abs(dots[i][1] - dots[j][1])
                        
            let anotherX = abs(dots[indices[0]][0] - dots[indices[1]][0])
            let anotherY = abs(dots[indices[0]][1] - dots[indices[1]][1])
            
            if Double(y) / Double(x) == Double(anotherY) / Double(anotherX) { return 1 }
        }
    }
    
    return 0
}