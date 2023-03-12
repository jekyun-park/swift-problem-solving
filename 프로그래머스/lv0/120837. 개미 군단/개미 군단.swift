import Foundation

func solution(_ hp:Int) -> Int {
    
    let first = hp / 5
    let second = (hp % 5) / 3 
    let third = ((hp % 5) % 3) / 1
    
    return first + second + third
}