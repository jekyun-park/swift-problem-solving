//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/12.
//  1

import Foundation

func solution(_ p: [Int]) -> [Int] {

    var p = p
    let sortedP = p.sorted()
    var answer = Array(repeating: 0, count: p.count)

    while p != sortedP {
        for index in 0..<p.count {
            let minimumValueIndex = p[index...].firstIndex(of: p[index...].min()!)
            if minimumValueIndex != index {
                let temp = p[minimumValueIndex!]
                p[minimumValueIndex!] = p[index]
                p[index] = temp
                answer[minimumValueIndex!] += 1
                answer[index] += 1
            }
        }
    }
    return answer
}
