//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/04/14.
//  Programmers > 월간 코드 챌린지 시즌2 > 2개 이하로 다른 비트

import Foundation

func solution(_ numbers: [Int64]) -> [Int64] {
    return numbers.map { differentBitsFunction($0) }
}

func differentBitsFunction(_ n: Int64) -> Int64 {
    if n % 2 == 0 { return n + 1 }
    else {
        let last = (~n) & (n + 1)
        return (n | last) & ~(last >> 1)
    }
}

/*
 10 -> 1010(2) : 2개 이하로 다른 비트를 가진 수 중 가장 작은 수는 11이 될 것이다. (10+1)
 그러나 11 -> 1011(2) : 13 이 된다.
 왜냐? 우선 1011(2)에서 1111(2) 로 바꾸는 것을 생각해보면 하나의 비트를 바꿈으로서 11->15가 되었다.
 그러나 2개의 비트까지 다를 수 있기 때문에 최대한 숫자를 작게 하기 위해서 방금 바꾼 0에서 1로 바꾼 수의 오른쪽 수를 0으로 바꾸면
 1101(2) -> 13 이 된다.
 */

// --> 시간초과 코드

//func differentBitsFunction(_ n: Int64) -> Int64 {
//
//    var minimumValue = n+1
//
//    while true {
//        let difference = (n^minimumValue).nonzeroBitCount
//        if difference <= 2 {
//            return minimumValue
//        } else {
//            minimumValue += 1
//        }
//    }
//}

// Test Case :
// print(solution([2, 7]))

