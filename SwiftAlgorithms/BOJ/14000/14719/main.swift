//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/04/17.
//  BOJ > 14719 > 빗물

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let heights = readLine()!.split(separator: " ").map { Int($0)! }

var left = 0
var right = heights.count - 1
var answer = 0
var leftMax = 0, rightMax = 0

while left < right {
    if heights[left] < heights[right] {
        if heights[left] >= leftMax {
            leftMax = heights[left]
        } else {
            answer += leftMax - heights[left]
        }
        left += 1
    } else {
        if heights[right] >= rightMax {
            rightMax = heights[right]
        } else {
            answer += rightMax - heights[right]
        }
        right -= 1
    }
}
print(answer)
