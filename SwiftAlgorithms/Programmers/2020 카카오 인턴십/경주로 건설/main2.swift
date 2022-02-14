//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/02/04.
//

import Foundation

func solution1(_ board: [[Int]]) -> Int {

    let N = board.count
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]
    var cost: [[Int]] = Array(repeating: Array(repeating: Int.max, count: N), count: N)
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: N), count: N)
    
    // x,y 좌표 distance 거리 previous 이전이동방향 cornerCount 돈 코너 개수
    var queue: [(x: Int, y: Int, distance: Int, previous: Int, cornerCount: Int)] = []

    queue.append((0, 0, 0, -1, 0))
    cost[0][0] = 0

    // DFS(스택)
    while !queue.isEmpty {

        let (x, y, distance, previous, cornerCount) = queue.popLast()!
//        var nextQueue = queue[1..<queue.count]

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            if !((0 <= nx && nx < N) && (0 <= ny && ny < N)) || board[nx][ny] == 1 {
                continue
            }

//            if cost[nx][ny] < distance * 100 + cornerCount * 500 - 400 { continue }

            // i == 0, 1 : 세로, i == 2,3 : 가로
            // (x, y, distance, previous, cornerCount)

            // 현재 가로 움직임 && 이전 직선 세로움직임 : 코너
            if (i == 2 || i == 3) && (previous == 0 || previous == 1) {
                let calculatedCost = (500 * (cornerCount + 1)) + (distance + 1) * 100
                if cost[nx][ny] >= calculatedCost {
                    cost[nx][ny] = calculatedCost
                    queue.append((nx, ny, distance + 1, i, cornerCount + 1))
//                    nextQueue.append((nx, ny, distance + 1, i, cornerCount + 1))
                }
                if (x, y) == (N - 1, N - 1) && cost[x][y] > calculatedCost {
                    cost[x][y] = calculatedCost
                }
            } else if (i == 2 || i == 3) && (previous == 2 || previous == 3) { // 가로움직임 && 가로움직임 : 직선
                let calculatedCost = (500 * (cornerCount)) + (distance + 1) * 100
                if cost[nx][ny] >= calculatedCost {
                    cost[nx][ny] = calculatedCost
                    queue.append((nx, ny, distance + 1, i, cornerCount))
//                    nextQueue.append((nx, ny, distance + 1, i, cornerCount))
                }
                if (x, y) == (N - 1, N - 1) && cost[x][y] > calculatedCost {
                    cost[x][y] = calculatedCost
                }
            } else if (i == 0 || i == 1) && (previous == 0 || previous == 1) { // 세로움직임 && 세로움직임 : 직선
                let calculatedCost = (500 * cornerCount) + (distance + 1) * 100
                if cost[nx][ny] >= calculatedCost {
                    cost[nx][ny] = calculatedCost
                    queue.append((nx, ny, distance + 1, i, cornerCount))
//                    nextQueue.append((nx, ny, distance + 1, i, cornerCount))
                }
                if (x, y) == (N - 1, N - 1) && cost[x][y] > calculatedCost {
                    cost[x][y] = calculatedCost
                }
            } else if (i == 0 || i == 1) && (previous == 2 || previous == 3) { // 세로움직임 && 가로움직임 : 코너
                let calculatedCost = (500 * (cornerCount + 1)) + (distance + 1) * 100
                if cost[nx][ny] >= calculatedCost {
                    cost[nx][ny] = calculatedCost
                    queue.append((nx, ny, distance + 1, i, cornerCount + 1))
//                    nextQueue.append((nx, ny, distance + 1, i, cornerCount + 1))
                }
                if (x, y) == (N - 1, N - 1) && cost[x][y] > calculatedCost {
                    cost[x][y] = calculatedCost
                }
            } else {
                let calculatedCost = (500 * (cornerCount)) + (distance + 1) * 100
                if cost[nx][ny] >= calculatedCost {
                    cost[nx][ny] = calculatedCost
                    queue.append((nx, ny, distance + 1, i, cornerCount))
//                    nextQueue.append((nx, ny, distance + 1, i, cornerCount))
                }
//                if (x, y) == (N - 1, N - 1) && cost[x][y] > calculatedCost {
//                    cost[x][y] = calculatedCost
//                }
            }
        }
//        queue = Array(nextQueue)
    }
    return cost[N - 1][N - 1]
}




//print(solution([[0, 0, 0], [0, 0, 0], [0, 0, 0]]))
//print(solution([[0, 0, 0, 0, 0, 0, 0, 1], [0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 1, 0, 0, 0], [0, 0, 0, 1, 0, 0, 0, 1], [0, 0, 1, 0, 0, 0, 1, 0], [0, 1, 0, 0, 0, 1, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0]]))
//print(solution([[0, 0, 1, 0], [0, 0, 0, 0], [0, 1, 0, 1], [1, 0, 0, 0]]))
//print(solution([[0, 0, 0, 0, 0, 0], [0, 1, 1, 1, 1, 0], [0, 0, 1, 0, 0, 0], [1, 0, 0, 1, 0, 1], [0, 1, 0, 0, 0, 1], [0, 0, 0, 0, 0, 0]]))
