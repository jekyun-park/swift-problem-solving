//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2023/03/30.
//

import Foundation

// 배열의 크기 N, 숫자가 더해지는 횟수 M, 특정 인덱스에 해당하는 수가 연속해서 K번을 초과하여 더할 수 없음.
let NMK = readLine()!.split(separator: " ").map { Int($0)! }
let input = readLine()!.split(separator: " ").map { Int($0)! }

var answer = 0
var addCount = NMK[1]

let sortedInput = input.sorted(by: >)


while true {
    
    // 가장 큰 수를 k번 더한다.
    for _ in 0..<NMK[2] {
        if addCount == 0 { break }
        answer += sortedInput[0]
        addCount -= 1
    }
    
    if addCount == 0 { break }
    // 그 다음으로 큰 수를 한번 더해준다.
    answer += sortedInput[1]
    addCount -= 1

}


print(answer)
