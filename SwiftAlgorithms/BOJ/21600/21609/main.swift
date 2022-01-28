//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/01/24.
//

import Foundation

/*
 Todo
 1. 크기가 가장 큰 블록 그룹을 찾는다. [x]
 2. 1에서 찾은 블록 그룹의 모든 블록을 맵에서 제거 : 좌표의 점을 -100으로 바꾼다. [x]
 3. 맵에 중력 작용 [x]
 4. 맵 90도 반시계 방향 회전 [x]
 5. 맵에 중력 작용
*/

// 검은블록 : -1

// 격자에 중력이 작용하면 검은색 블록을 제외한 모든 블록이 행의 번호가 큰 칸으로 이동한다. 이동은 다른 블록이나 격자의 경계를 만나기 전까지 계속 된다.
// 중력 작용

func actGravity(_ map: inout [[Int]]) -> [[Int]] {
    let num = map.count
    var newMap = Array(repeating: Array(repeating: -100, count: num), count: num)

    for i in 0..<num {
        var currentIndex = num - 1
        for j in (0..<num).reversed() {
            if map[j][i] == -100 { continue }
            if map[j][i] == -1 { currentIndex = j }
            newMap[currentIndex][i] = map[j][i]
            currentIndex -= 1
        }
    }
    map = newMap
    return map
}

// 제거대상인 block 값을 -100으로 바꿔줌, -100은 공백인 블록을 의미함
func deleteBlocks(_ map: inout [[Int]], _ blocks: [(Int, Int)]) -> [[Int]] {
    for block in blocks {
        let x = block.0, y = block.1
        map[x][y] = -100
    }
    return map
}

// 맵 반시계90도 회전
func rotateCounterClockWise(_ map: inout [[Int]]) -> [[Int]] {
    let num = map.count // 5
    var newMap: [[Int]] = []

    for i in (0..<num).reversed() {
        var arr: [Int] = []
        for j in 0..<num {
            arr.append(map[j][i])
            if arr.count == num { newMap.append(arr) }
        }
    }
    map = newMap

    return map
}

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0] // N = 격자 한변의 크기, M = 색상의 수
var map: [[Int]] = []
let dx = [1, -1, 0, 0]
let dy = [0, 0, 1, -1]

for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(line)
}
// map 구성 완료
var score: Int = 0
var maxBlock: [(Int, Int)] = []
var blockGroup: [[(Int
    , Int)]] = []
var queue: [(Int, Int)] = []
var visited: [[Int]] = Array(repeating: Array(repeating: 0, count: N), count: N)
var rainbow: [(Int, Int)] = []
for i in 0..<map.count {
    for j in 0..<map[0].count {
        if map[i][j] == 0 { rainbow.append((i, j)) }
    }
}

while true {
    // 한점씩 확인하면서 제일 큰 블록 그룹을 찾기 (bfs)
    // 무지개 블록 : 0, 검은색 블록 : -1
    queue = []
    visited = Array(repeating: Array(repeating: 0, count: N), count: N)
    maxBlock = []
    blockGroup = []
    rainbow = []
    for i in 0..<map.count {
        for j in 0..<map[0].count {
            if map[i][j] == 0 { rainbow.append((i, j)) }
        }
    }

    for i in 0..<map.count {
        for j in 0..<map[0].count {
//            if visited[i][j] == 1 { continue }
            if map[i][j] == -100 { continue }
            if map[i][j] == -1 { continue }
            if map[i][j] == 0 { continue }



            queue.append((i, j))
            visited[i][j] = 1
            var blockArea: [(Int, Int)] = [(i, j)] // 그룹으로 묶이는거지
//            var rainbowCount = 0
//            if map[i][j] == 0 { rainbowCount += 1}

            while !queue.isEmpty {
                let (x, y) = queue.removeFirst()
                for k in 0..<4 {
                    let nx = x + dx[k]
                    let ny = y + dy[k]

                    // if (map[nx][ny] == -1) { continue }
                    // 범위 초과
                    if nx < 0 || nx >= N || ny < 0 || ny >= N { continue }
                    // 이미 방문
                    if visited[nx][ny] == 1 { continue }
                    // [nx][ny] 가 검은블록이거나 [nx][ny]가 무지개블록이 아닌데 [i][j]와 색상이 다르다면 skip
                    if (map[nx][ny] != 0) && (map[nx][ny] != map[i][j]) { continue }
//                    if map[nx][ny] == 0 { rainbowCount += 1}
                    queue.append((nx, ny))
                    blockArea.append((nx, ny))
                    visited[nx][ny] = 1


                }
            }
            // 무지개 블록 visited 를 false로 돌려주기
            for point in rainbow {
                visited[point.0][point.1] = 0
            }
            let rainbowCount = blockArea.lazy.filter { map[$0.0][$0.1] == 0 }.count
            if blockArea.count - rainbowCount < 1 { continue }
            if blockArea.count >= 2 { blockGroup.append(blockArea) }

            // 제일 큰 블록 찾기 : 배열에 넣은 좌표의 갯수가 더많다면 갱신해줌
            if maxBlock.count == blockArea.count {
                let maxBlockRainbow = maxBlock.lazy.filter { map[$0.0][$0.1] == 0 }.count
                let blockAreaRainbow = blockArea.lazy.filter { map[$0.0][$0.1] == 0 }.count
                if maxBlockRainbow == blockAreaRainbow { // 기준 블록의 행이 가장 큰것, 열이 가장 큰것
                    // 기준 블록 찾기
                    maxBlock.sort(by: <)
                    blockArea.sort(by: <)
                    let x = maxBlock[0]
                    let y = blockArea[0]

                    if x.0 == y.0 {
                        maxBlock = x.1 > y.1 ? maxBlock : blockArea
                    } else {
                        maxBlock = x.0 > y.0 ? maxBlock : blockArea
                    }

                } else {
                    maxBlock = maxBlockRainbow > blockAreaRainbow ? maxBlock : blockArea
                }
            } else {
                maxBlock = maxBlock.count > blockArea.count ? maxBlock : blockArea
            }

//            print(maxBlock)

        }
    }
    print(blockGroup, blockGroup.count)
    if blockGroup.count < 2 { break }
    deleteBlocks(&map, maxBlock)
    score += maxBlock.count * maxBlock.count
    actGravity(&map)
    rotateCounterClockWise(&map)
    actGravity(&map)

}
//print(map)
print(score)
