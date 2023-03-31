//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2023/03/31.
//

import Foundation

let N = Int(readLine()!)!
var adventurers = readLine()!.split(separator: " ").map { Int($0)! }
var answer = 0

//// 나의 풀이
//adventurers.sort(by: <)
//var group = [Int]()
//var limit = adventurers[0]
//
//for i in 0..<adventurers.count {
//
//    if group.isEmpty {
//        group.append(adventurers[i])
//        limit = adventurers[i]
//    } else if group.count == limit {
//        answer += 1
//        group.removeAll()
//    } else {
//        group.append(adventurers[i])
//    }
//
//}
//
//print(answer)

// 해답 풀이
adventurers.sort(by: <)
var count = 0 // 현재 그룹에 포함된 모험가의 수

for i in adventurers {
    count += 1 // 현재 그룹에 해당 모험가를 포함시킨다.
    if count >= i { // 현재 그룹에 포함된 모험가의 수가 해당 모험가의 공포도보다 크다면, 그룹을 결성해준다.
        answer += 1
        count = 0 // 그룹을 비워준다.
    }
}
print(answer)

