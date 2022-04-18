//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/04/15.
//  Programmers > 2019 카카오 개발자 겨울 인턴십 > 징검다리 건너기

import Foundation

// 시간초과 코드
//func solution(_ stones: [Int], _ k: Int) -> Int {
//
//    var answer: Int = 0
//    var stones = stones
//    let n = stones.count
//
//    while true {
//        print(stones)
//        var blankCount = 0
//        for i in 0..<n {
//            if stones[i] == 0 {
//                blankCount += 1
//                if blankCount > k { return answer }
//            } else {
//                blankCount = 0
//            }
//            stones[i] = stones[i] == 0 ? 0 : stones[i] - 1
//        }
//        answer += 1
//    }
//}

func solution(_ stones: [Int], _ k: Int) -> Int {

    var start = 1
    var end = 200000000

    while start < end {
        let mid = (start + end) / 2
        var count = 0
        
        for i in 0..<stones.count {
            if (stones[i]-mid) <= 0 {
                count += 1
                if count >= k { break }
            } else {
                count = 0
            }
        }
        
        if count >= k { end = mid }
        else { start = mid + 1 }
    }

    return start
}




// Test Case :
// print(solution([2, 4, 5, 3, 2, 1, 4, 2, 5, 1], 3))
