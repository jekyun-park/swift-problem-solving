//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/06.
//

import Foundation

func solution(_ arr: [Int]) -> [Int] {

    var answer: [Int] = []
    var dictionary: [Int: Int] = [:]
    let newArr = arr.sorted()

    for num in newArr {
        dictionary[num, default: 0] += 1
    }

    dictionary.sorted { a, b in
        a.key < b.key
    }.forEach {
        if $0.value > 1 {
            answer.append($0.value)
        }
    }

    if answer.count == 0 { answer.append(-1) }

    return answer
}

print(solution([1, 2, 3, 3, 3, 3, 4, 4]))
print(solution([3, 2, 4, 4, 2, 5, 2, 5, 5]))
print(solution([3, 5, 7, 9, 1]))
