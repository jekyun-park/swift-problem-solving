//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/30.
//  BOJ > 14891 > 톱니바퀴

import Foundation

var gears: [[String]] = []

// 톱니바퀴 배열 생성 (0,1,2,3)
for _ in 0..<4 {
    gears.append(Array(readLine()!).map { String($0) })
}

let K = Int(readLine()!)!

var moves: [(gear: Int, direction: Int)] = []
for _ in 0..<K {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    moves.append((info[0], info[1]))
}

// [회전할 톱니바퀴 번호,방향]
var waitRotate: Set<[Int]> = []

func rotate(_ index: Int, _ direction: Int) {
    if direction == 1 {
        let element = gears[index].removeLast()
        gears[index].insert(element, at: 0)
    } else {
        let element = gears[index].removeFirst()
        gears[index].append(element)
    }
}

// index 톱니바퀴 기준으로 좌우 톱니바퀴를 확인한다.
func checkGears(_ index: Int, _ direction: inout Int) {

    let firstDirection = direction
    waitRotate.insert([index-1,direction])
    
    for i in index - 1..<3 {
        if gears[i][2] != gears[i + 1][6] {
            waitRotate.insert([i, direction])
            direction *= -1
            waitRotate.insert([i+1, direction])
        } else { break }
    }

    direction = firstDirection

    for i in (1..<index).reversed() {
        if gears[i][6] != gears[i - 1][2] {
            waitRotate.insert([i, direction])
            direction *= -1
            waitRotate.insert([i-1, direction])
        } else { break }
    }
}

for move in moves {
    var move = move
    checkGears(move.gear, &move.direction)
    waitRotate.forEach {
        rotate($0[0],$0[1])
    }
    waitRotate.removeAll()
}

var answer = 0
answer += gears[0][0] == "0" ? 0 : 1
answer += gears[1][0] == "0" ? 0 : 2
answer += gears[2][0] == "0" ? 0 : 4
answer += gears[3][0] == "0" ? 0 : 8

print(answer)

/*
 회전시킬 톱니바퀴 번호 (index)
 -> 회전시킨다. 맞닿아있는 톱니바퀴가 현재 톱니와 극이 다르다면 반대방향으로 회전시킨다.
 */
