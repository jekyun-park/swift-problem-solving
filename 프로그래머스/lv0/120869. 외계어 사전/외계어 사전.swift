import Foundation

func solution(_ spell:[String], _ dic:[String]) -> Int {
    
    let newDic = dic.map { Array($0) }
    
    for word in newDic {
        
        var isUsingSpell = Array(repeating: false, count: spell.count)
        
        for alphabet in word {
            
            if spell.contains(String(alphabet)) {
                if let index = spell.firstIndex(of: String(alphabet)) {
                    if isUsingSpell[index] == false {
                        isUsingSpell[index] = true
                    } else {
                        break
                    }
                }
            }
        }
        
        if isUsingSpell.filter { $0 == true }.count == spell.count { return 1 }
    }
    
    return 2
}