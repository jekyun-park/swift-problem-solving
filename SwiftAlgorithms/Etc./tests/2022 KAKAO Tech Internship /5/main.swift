//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/05/07.
//

import Foundation

func solution(_ rc: [[Int]], _ operations: [String]) -> [[Int]] {

    var rc = rc

    for operation in operations {
        if operation == "ShiftRow" {
            shiftRow(&rc)
        } else {
            rotate(&rc)
        }
    }

    return rc
}

func shiftRow(_ map: inout [[Int]]) {

    var newMap = map
    let temp = map.last!

    for i in 0..<map.count - 1 {
        newMap[i + 1] = map[i]
    }
    newMap[0] = temp
    map = newMap

}


func rotate(_ map: inout [[Int]]) {

    var newMap = map

    for i in 0..<map[0].count - 1 {
        newMap[0][i + 1] = map[0][i]
    }

    for i in 0..<map.count - 1 {
        newMap[i + 1][map[0].count - 1] = map[i].last!
    }

    for j in (1..<map[0].count).reversed() {
        newMap[map.count - 1][j - 1] = map[map.count - 1][j]
    }

    for j in (1..<map.count).reversed() {
        newMap[j - 1][0] = map[j].first!
    }

    map = newMap
}

//var map = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]]
//rotate(&map)
//print(map)

//print(solution([[1, 2, 3], [4, 5, 6], [7, 8, 9]], ["Rotate", "ShiftRow"]))
//print(solution([[8, 6, 3], [3, 3, 7], [8, 4, 9]], ["Rotate", "ShiftRow", "ShiftRow"]))
print(solution([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]], ["ShiftRow", "Rotate", "ShiftRow", "Rotate"]))
