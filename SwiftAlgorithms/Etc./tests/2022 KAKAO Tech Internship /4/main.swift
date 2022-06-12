//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/05/07.
//

import Foundation

func solution(_ n: Int, _ paths: [[Int]], _ gates: [Int], _ summits: [Int]) -> [Int] {

    /*
     gate - summit - gate (돌아올 때 같은 게이트여야 함)
     intensity는 최솟값이어야 한다.
    */
    
    var answers: [(intensity: Int, summit: Int)] = []

    var allDistances = Array(repeating: Int.max, count: n + 1)
    var allRoutes = (0...n).map { [$0] }

    var routes: [[[Int]]] = []
    gates.forEach {
        dijkstra($0)
        routes.append(allRoutes)
    }
    summits.forEach {
        dijkstra($0)
        routes.append(allRoutes)
    }
    print(routes)

    func dijkstra(_ start: Int) -> Int {
        allDistances[start] = 0
        var queue: [Int] = [start]
        var queueIndex = 0
        while queueIndex < queue.count {
            let first = queue[queueIndex]
            queueIndex += 1
            //연결 정보에서 큐의 첫번째 값이 있는 것들로 필터링 해줌.
            let filterNodes = paths.filter { $0[0] == first || $0[1] == first }
            for node in filterNodes {
                let connectionNode = node[0] == first ? node[1] : node[0]
                //만약 Int 최댓값이라면 continue
                if allDistances[first] == Int.max { continue }
                //첫번째 값에 거리를 더한 것이 원래 있는 값보다 작다면
                if node[2] < allDistances[connectionNode] {
                    //첫번째 값에 거리를 더한 것으로 업데이트
                    allDistances[connectionNode] = min(allDistances[first], node[2])
                    var newRoute = allRoutes[first]
                    newRoute.append(connectionNode)
                    allRoutes[connectionNode] = newRoute
                    queue.append(connectionNode)
                }
            }
        }
        return start
    }
    print(allRoutes)
    print(allDistances)
    return [0]
}

print(solution(6, [[1, 2, 3], [2, 3, 5], [2, 4, 2], [2, 5, 4], [3, 4, 4], [4, 5, 3], [4, 6, 1], [5, 6, 1]], [1, 3], [5]))
//print(solution(7, [[1, 4, 4], [1, 6, 1], [1, 7, 3], [2, 5, 2], [3, 7, 4], [5, 6, 6]], [1], [2, 3, 4]))
//print(solution(7, [[1, 2, 5], [1, 4, 1], [2, 3, 1], [2, 6, 7], [4, 5, 1], [5, 6, 1], [6, 7, 1]] ,[3, 7] ,[1, 5]))
//print(solution(5, [[1, 3, 10], [1, 4, 20], [2, 3, 4], [2, 4, 6], [3, 5, 20], [4, 5, 6]], [1, 2], [5]))


