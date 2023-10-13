func solution(_ s:String, _ n:Int) -> String {    
    
    let alphabets = "abcdefghijklmnopqrstuvwxyz".map { $0 }

    return String(s.map { 
        guard let index = alphabets.firstIndex(of: Character($0.lowercased())) else { return $0 }
        let letter = alphabets[(index + n) % 26]
        
        return $0.isUppercase ? Character(letter.uppercased()) : letter
    })
}