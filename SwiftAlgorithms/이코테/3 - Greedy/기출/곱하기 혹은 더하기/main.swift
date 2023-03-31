//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2023/03/31.
//

import Foundation

let numbers = readLine()!.map { Int(String($0))! }

//var answer = numbers[0]

//for i in 1..<numbers.count {
//
//    if answer == 0 {
//        answer += numbers[i]
//    } else {
//        answer *= numbers[i]
//    }
//
//}
//
//print(answer)

// 해답 설명을 읽고 다시 작성한 코드
//var answer = numbers[0]
//for i in 1..<numbers.count {
//    if answer == 0 || answer == 1 || numbers[i] == 0 || numbers[i] == 1 {
//        answer += numbers[i]
//    } else {
//        answer *= numbers[i]
//    }
//}
//
//print(answer)

// 해답의 python 코드를 swift로 바꾼 코드
var answer = numbers[0]
for i in 1..<numbers.count {
    if answer <= 1 || numbers[i] <= 1 {
        answer += numbers[i]
    } else {
        answer *= numbers[i]
    }
}
print(answer)
