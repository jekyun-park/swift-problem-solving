//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2023/03/31.
//  BOJ > 1439: 뒤집기

import Foundation

// 첫 풀이 코드 - 12분 소요: 틀렸습니다.

let numbers = readLine()!
//let zeroCount = numbers.filter { $0 == "0" }.count
//let oneCount = numbers.count - zeroCount
//var answer = 0
//
//if zeroCount > oneCount {
//    answer = numbers.split(separator: "0").count
//} else {
//    answer = numbers.split(separator: "1").count
//}
//
//(zeroCount == 0 || oneCount == 0) ? print(0) : print(answer)

// 재채점 코드: 통과
//let answer = min(numbers.split(separator: "0").count, numbers.split(separator: "1").count)
//print(answer)

extension String {
    subscript(_ index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}

// 해설 코드 in Swift
var count0 = 0
var count1 = 0

if numbers.first! == "0" {
    count0 += 1
} else {
    count1 += 1
}

for i in 0..<numbers.count-1 {
    if numbers[i] != numbers[i+1] {
        if numbers[i+1] == "1" {
            count0 += 1
        } else {
            count1 += 1
        }
    }
}

print(min(count0, count1))

