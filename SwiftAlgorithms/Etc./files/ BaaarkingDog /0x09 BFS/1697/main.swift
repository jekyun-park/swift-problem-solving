//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/05/06.
//  BOJ > 1697> 숨바꼭질

import Foundation

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0], K = NK[1]

var visited = Array(repeating: false, count: 100001)
var queue = [(location: N, time: 0)]
var queueIndex = 0
var isFound = false

if N == K {
    print(0)
} else {
    while queueIndex < queue.count {

        let (currentLocation, currentTime) = queue[queueIndex]
        queueIndex += 1
        var nextLocation = 0

        for i in 0..<3 {
            if i == 0 {
                nextLocation = currentLocation - 1
            } else if i == 1 {
                nextLocation = currentLocation + 1
            } else {
                nextLocation = currentLocation * 2
            }

            if nextLocation < 0 || nextLocation > 100000 || visited[nextLocation] { continue }

            if nextLocation == K {
                isFound = true
                break
            }

            visited[nextLocation] = true
            queue.append((nextLocation, currentTime + 1))

        }

        if isFound {
            print(currentTime + 1)
            break
        }

    }
}

