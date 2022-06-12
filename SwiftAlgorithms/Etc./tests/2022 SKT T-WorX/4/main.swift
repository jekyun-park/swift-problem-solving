//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/12.
//

import Foundation

func solution(_ grid: [String], _ k: Int) -> Int {

    // 상,하,좌,우
    // . -> 평지, F -> 숲 #-> 강
    // 강으로는 건널 수 X
    let dx = [0, 0, -1, 1]
    let dy = [-1, 1, 0, 0]

    var map: [[String]] = []
    var answer: Int = 0 // 최소 야영 횟수

    grid.forEach {
        map.append(Array($0).map { String($0) })
    }

    let n = map.count
    let m = map[0].count

    func checkBorder(_ r: Int, _ c: Int) -> Bool {
        0..<n ~= r && 0..<m ~= c
    }

    func checkDistance(_ r: Int, _ c: Int) -> Int {
        return abs(n - r) + abs(m - c)
    }


    var queue: [(x: Int, y: Int, moveCount: Int, campCount: Int)] = [(0, 0, k, 0)]
    var queueCursor = 0

    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
    var distance: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
    distance[0][0] = 1

    while queueCursor < queue.count {

        let (x, y, forestCount, flatLandCount) = queue[queueCursor]
        if x == n - 1 && y == m - 1 {

//            print("평지 수:\(flatLandCount)")
//            print("숲 수:\(forestCount)")
//            print("n,m 까지 거리:\(distance[n - 1][m - 1] - 1)")
//            print("이동가능거리:\(k)")

            if distance[n - 1][m - 1] - 1 == k {
                answer = 0
            } else if (distance[n - 1][m - 1] - 1) % k == 0 {
                answer = (distance[n - 1][m - 1] - 1) / k
            }
            else {
                answer = (distance[n - 1][m - 1] - 1) % k
            }

            break
        }

        queueCursor += 1

        for i in 0..<4 {

            let newX = x + dx[i]
            let newY = y + dy[i]

            if !checkBorder(newX, newY) { continue }
            if map[newX][newY] == "#" { continue }
            if visited[newX][newY] { continue }

            if map[newX][newY] == "." {
                queue.append((newX, newY, forestCount, flatLandCount + 1))
                visited[newX][newY] = true
                distance[newX][newY] = distance[x][y] + 1
            } else if map[newX][newY] == "F" {
                queue.append((newX, newY, forestCount + 1, flatLandCount))
                visited[newX][newY] = true
                distance[newX][newY] = distance[x][y] + 1
            }
        }

    }
    return answer
}



//print(solution(["..FF", "###F", "###."], 4))
//
//print(solution(["..FF", "###F", "###."], 5))
//
//print(solution([".F.FFFFF.F", ".########.", ".########F", "...######F", "##.######F", "...######F", ".########F", ".########.", ".#...####F", "...#......"], 6))
