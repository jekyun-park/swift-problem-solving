let n = Int(readLine()!)!
let string = readLine()!.map { Int(UnicodeScalar(String($0))!.value)-96 }
var answer = 0
var r = 1

for value in string {
    
    answer += value * r
    r *= 31 % 1234567891
    
}

print(answer)