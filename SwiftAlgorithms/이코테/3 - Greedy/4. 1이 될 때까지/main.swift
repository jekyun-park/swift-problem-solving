//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2023/03/31.
//

import Foundation

let NK = readLine()!.split(separator: " ").map { Int($0)! }
var N = NK[0]
let K = NK[1]
var answer = 0

// 1번째 풀이
//while N >= K {
//    // N이 K로 안나눠질 수 있음으로 K로 나눠질 때까지 빼준다.
//    while N % K != 0 {
//        N -= 1
//        answer += 1
//    }
//
//    N /= K
//    answer += 1
//}
//
//while N > 1 {
//    N -= 1
//    answer += 1
//}
//
//print(answer)

// 2번째 풀이

while true {
    
    let target = (N / K) * K
    answer += N - target
    
    N = target
    
    if N < K { break }
    
    answer += 1
    N /= K
}

answer += N-1
print(answer)
