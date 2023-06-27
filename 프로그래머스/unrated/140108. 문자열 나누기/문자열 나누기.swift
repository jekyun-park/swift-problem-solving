import Foundation

func solution(_ s:String) -> Int {
    
    var letters = s.map { String($0) }
    var first = ""
    var array: [String] = []
    var answer = 0
    
    for i in 0..<letters.count {
        
        if array.isEmpty {
            first = letters[i]
            array.append(letters[i])
        } else {
            array.append(letters[i])
            if array.filter { $0 == first }.count == array.filter { $0 != first }.count {
                array.removeAll()
                answer += 1
            } 
        }
        
        if i == letters.count - 1 {
            if array.count > 0 { answer += 1 }
        }
    }
    
    return answer 
}
