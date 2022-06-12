//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/05/07.
//

import Foundation

func solution(_ queue1: [Int], _ queue2: [Int]) -> Int {

    var queue1 = queue1
    var queue2 = queue2
    var answer = 0
    var flag = false

    var sumOfQueue1 = queue1.reduce(0, +)
    var sumOfQueue2 = queue2.reduce(0, +)


    while true {
        if sumOfQueue1 > sumOfQueue2 {
            let poped = queue1.first!
            queue1 = Array(queue1[1...])
            queue2.append(poped)
            answer += 1
        } else if sumOfQueue1 < sumOfQueue2 {
            let poped = queue2.first!
            queue2 = Array(queue2[1...])
            queue1.append(poped)
            answer += 1
        }

        sumOfQueue1 = queue1.reduce(0, +)
        sumOfQueue2 = queue2.reduce(0, +)

        if sumOfQueue1 == sumOfQueue2 {
            break
        }
        if answer > queue2.count + queue1.count {
            flag = true
            break
        }
    }

    return flag ? -1 : answer
}

print(solution([3,2,7,2], [4,6,5,1]))
print(solution([1, 2, 1, 2],[1, 10, 1, 2]))
print(solution([1, 1], [1, 5]))
