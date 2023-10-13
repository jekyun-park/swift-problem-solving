func solution(_ s: String) -> String {
    
    var index = 0
    var answer = ""
    
    for character in s {
        if character == " " {
            index = -1
            answer += String(character)
        } else {
            (index % 2 == 0) ? (answer += String(character).uppercased()) : (answer += String(character).lowercased())
        }   
        index += 1
    }
    
    return answer
}
