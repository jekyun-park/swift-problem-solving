//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/05/05.
//  BOJ > 1021 > 회전하는 큐

import Foundation


let NM = readLine()!.split(separator: " ").map { Int($0)! }
var locations = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]
var deque = [Int](1...N)
var answer = 0



func find(_ target: Int) {

    var lhs = 0, rhs = 0

    for i in 0..<deque.count {
        if deque[i] == target {
            lhs = i
            rhs = deque.count - i
            break
        }
    }

    if lhs < rhs {
        for _ in 0..<lhs {
            deque.append(deque.removeFirst())
        }
        answer += lhs
    } else {
        for _ in 0..<rhs {
            deque.insert(deque.removeLast(), at: 0)
        }
        answer += rhs
    }
    
    deque.removeFirst()
}

locations.forEach { find($0) }
print(answer)





