import Foundation

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    
    let map = park.map { Array($0).map { String($0) } }
    var answer = findStart(map)
    
    for route in routes {
        let direction = String(route.first!)
        let distance = Int(String(route.last!))!
        move(direction, &answer, distance, map)
    }
    
    return answer
}

func findStart(_ map: [[String]]) -> [Int] {
    
    let w = map[0].count
    let h = map.count
    
    for i in 0..<h {
        for j in 0..<w {
            if map[i][j] == "S" { return [i, j] }
        }
    }
    
    return [0, 0]
}

func checkRoad(_ x: Int, _ y: Int, _ map: [[String]]) -> Bool {
    
    let w = map[0].count
    let h = map.count
    
    if !((0..<h ~= x) && (0..<w ~= y)) { return false }
    if map[x][y] == "X" { return false } 
    
    return true 
}

func move(_ direction: String, _ position: inout [Int], _ distance: Int, _ map: [[String]]) {
    
    switch direction {
        case "N":
            var isPossible = true
            for i in 1...distance {
                if !checkRoad(position[0]-i, position[1], map) {
                    isPossible = false
                }
            }
            if isPossible { position = [position[0]-distance, position[1]] }
        case "S":
            var isPossible = true
            for i in 1...distance {
                if !checkRoad(position[0]+i, position[1], map) {
                    isPossible = false
                }
            }
            if isPossible { position = [position[0]+distance, position[1]] } 
        case "W":
            var isPossible = true
            for i in 1...distance {
                if !checkRoad(position[0], position[1]-i, map) {
                    isPossible = false
                }
            }
            if isPossible { position = [position[0], position[1]-distance] }
        case "E":
            var isPossible = true
            for i in 1...distance {
                if !checkRoad(position[0], position[1]+i, map) {
                    isPossible = false
                }
            }
            if isPossible { position = [position[0], position[1]+distance] }
        default: 
            break
    }
    
}