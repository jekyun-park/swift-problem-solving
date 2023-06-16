import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    
    var players = players
    var dictionary = [String: Int]()
    
    for i in 0..<players.count {
        dictionary[players[i]] = i
    }
    
    for i in 0..<callings.count {
        
        let call = callings[i] // 이름
        let index = dictionary[call]!
        let name = players[index-1] 
        
        players[index] = name
        players[index-1] = call
        dictionary[call]! -= 1
        dictionary[name]! += 1
    }
    
    
    return players
}