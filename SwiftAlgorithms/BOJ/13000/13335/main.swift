//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/30.
//  BOJ > 13335 > 트럭

import Foundation

let informations = readLine()!.split(separator: " ").map { Int($0)! }
let n = informations[0], w = informations[1], L = informations[2]
var trucks = readLine()!.split(separator: " ").map { Int($0)! }
var answer = 0
var bridge: [Int] = Array(repeating: 0, count: w)

// 다리의 모든 트럭이 지나갈 때까지 반복
while !bridge.isEmpty {
//    print(bridge)
    answer += 1
    bridge.removeFirst()
    
    if !trucks.isEmpty {
        // 현재 다리에 있는 모든 트럭과 진입하려는 트럭의 무게의 합이 다리의 하중보다 크다면
        if bridge.reduce(0,+) + trucks[0] > L {
            // 못들어오고
            bridge.append(0)
        } else {
            // 아니라면 트럭 진입
            bridge.append(trucks.removeFirst())
        }
    }
    
}

print(answer)
