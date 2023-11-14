func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    
    var numbers = ""
    var answer = ""
    
    for i in 0...(t*m) {
        numbers += String(i, radix: n)
    }
    
    let n = numbers.count
    
    for i in stride(from: p-1, through: n-1, by: m) {
        if answer.count == t { break }
        let index = numbers.index(numbers.startIndex, offsetBy: i)
        answer += String(numbers[index])
    }
    
    return answer.uppercased()
}