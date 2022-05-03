//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/04/20.
//

import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    
    var map = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    for cost in costs {
        map[cost[0]][cost[1]] = cost[2]
        map[cost[1]][cost[0]] = cost[2]
    }
    
    for i in 0..<n {
        let minValue = map[i].min()
    }
    
    return 0
}

print(solution(4, [[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]]))
