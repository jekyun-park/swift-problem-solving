//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/04/17.
//  Programmers > 2020 카카오 인턴십 > 동굴 탐험

import Foundation

func solution(_ n: Int, _ path: [[Int]], _ order: [[Int]]) -> Bool {

    var cave: [Int: [Int]] = [:]
    
    path.forEach {
        cave[$0[0],default: []].append($0[1])
        cave[$0[1],default: []].append($0[0])
    }
    
    var closed: [Int:Int] = [:]
    var waiting: [Int:Int] = [:]
    order.forEach {
        closed[$0[0]] = $0[1]
        waiting[$0[1]] = $0[0]
    }
    
    if let _ = waiting[0] {
        return false
    }
        
    var toGo = [0]
    var toGoAfterOpen = Array(repeating: false, count: n)
    var visited = Array(repeating: false, count: n)
    
    while !toGo.isEmpty {
        let node = toGo.popLast()!
        visited[node] = true
        
        if let opened = closed[node] {
            closed[node] = nil
            if toGoAfterOpen[opened] {
                toGoAfterOpen[opened] = false
                toGo.append(opened)
            } else {
                waiting[opened] = nil
            }
        }
        
        for i in cave[node]! {
            if !visited[i] && !toGoAfterOpen[i] {
                if waiting[i] != nil {
                    waiting[i] = nil
                    toGoAfterOpen[i] = true
                } else {
                    toGo.append(i)
                }
            }
        }
        
        
    }
    return closed.isEmpty
}

print(solution(9, [[0, 1], [0, 3], [0, 7], [8, 1], [3, 6], [1, 2], [4, 7], [7, 5]], [[8, 5], [6, 7], [4, 1]]))

