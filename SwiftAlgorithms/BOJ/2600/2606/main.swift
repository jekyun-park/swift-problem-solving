//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/01/18.
// BOJ 2606

import Foundation

let numOfComputer = Int(readLine()!)!
let connectedComputerPair = Int(readLine()!)!

var network: [[Int]] = Array(repeating: [], count: numOfComputer + 1)
var visited: [Int] = []
var que: [Int] = []


for _ in 1...connectedComputerPair {

    let arr = readLine()!.split(separator: " ").map { Int($0)! }

    network[arr[0]].append(arr[1])
    network[arr[1]].append(arr[0])

}

que.append(1)
visited.append(1)

while !que.isEmpty {


    let nextComputer = que.removeFirst()
    
    for i in 0..<network[nextComputer].count {

        if visited.contains(network[nextComputer][i]) { continue }

        visited.append(network[nextComputer][i])
        que.append(network[nextComputer][i])
    }
    

}

print(visited.count-1)

