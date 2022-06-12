//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/05/07.
//

import Foundation


func solution(_ alp: Int, _ cop: Int, _ problems: [[Int]]) -> Int {

    // 저비용, 고효율로 해야한다, 그런데 어쨌든 문제들을 다 한번씩 풀어야함
    var status = (alp: alp, cop: cop)
    var answer = 0

    var visited = Array(repeating: 0, count: problems.count)

    let sortedProblems = problems.sorted { a, b in
        return (a.first! < b.first!) && (a[1] < b[1])
    }
    

//        if visited.reduce(0, +) == problems.count { break }
        for (index, value) in sortedProblems.enumerated() {
            print(value)
            if (status.alp >= value[0]) && (status.cop >= value[1]) {
                status.alp += value[2]
                status.cop += value[3]
                visited[index] = 1
                answer += value.last!
            } else {
                if status.alp - value[0] > 0 {
                    status.alp += status.alp - value[0]
                    answer += status.alp - value[0]
                }
                if status.cop - value[1] > 0{
                    status.cop += status.cop - value[1]
                    answer += status.cop - value[1]
                }
                
            }
        
        }
    

    print(visited,status)
    return answer
}

print(solution(10, 10, [[10, 15, 2, 1, 2], [20, 20, 3, 3, 4]]))
