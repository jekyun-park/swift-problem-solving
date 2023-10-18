func solution(_ s:String) -> String {
    
    var answer = ""
    var index = -1
    
    for character in s {
        if character == " " {
            index = -1
            answer += " "
        } else {
            index += 1
            index == 0 ? (answer += character.uppercased()) : (answer += character.lowercased())
        }
    }
    
    return answer
}