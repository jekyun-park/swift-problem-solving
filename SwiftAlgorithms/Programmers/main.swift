//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/04/01.
//  Programmers > Summer-Winter Coding(~2018) > 숫자 게임

import Foundation

func solution(_ a: [Int], _ b: [Int]) -> Int {

    var answer = 0
    let numberOfPeople = a.count
    
    var a = a
    a.sort(by: >)
    var b = b
    b.sort(by: >)
    
    var j = 0
    for i in 0..<numberOfPeople {
        if b[j] > a[i] {
            j += 1
            answer += 1
        }
    }
    return answer
}

// print(solution([5, 1, 3, 7], [2, 2, 6, 8]))
// solution([2,2,2,2], [1,1,1,1])

