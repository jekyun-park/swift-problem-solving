import Foundation

var N = Int(readLine()!)!
var answer = 0

if N % 5 == 0 {
    answer += N/5
    print(answer)
} else {
    while N > 0 {
        N -= 3
        answer += 1
        
        if N % 5 == 0 {
            answer += N/5
            print(answer)
            break
        } else if N == 1 || N == 2 {
            print(-1)
            break
        } else if N == 0 {
            print(answer)
            break
        }
    }
}