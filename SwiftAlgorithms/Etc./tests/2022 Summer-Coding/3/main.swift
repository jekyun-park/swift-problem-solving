//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/05/08.
//

import Foundation

let keyboard: [[String]] = [["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"], ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"]]

func solution(_ line: String) -> [Int] {
    var handPosition = (left: (1, 0), right: (1, 9))
    var answer: [Int] = []

    line.map { String($0) }.forEach {
        for i in 0...1 {
            for j in 0..<10 {
                if keyboard[i][j] == $0 {
                    let left = manhattanDistance(handPosition.left.0, handPosition.left.1, i, j)
                    let right = manhattanDistance(handPosition.right.0, handPosition.right.1, i, j)

                    if left > right {
                        answer.append(1)
                        handPosition.right = (i, j)
                    } else if left < right {
                        answer.append(0)
                        handPosition.left = (i, j)
                        
                    } else {
                        let leftDistance = calculateDistance(handPosition.left.0, handPosition.left.1, i, j)
                        let rightDistance = calculateDistance(handPosition.right.0, handPosition.right.1, i, j)

                        if leftDistance > rightDistance {
                            answer.append(1)
                            handPosition.right = (i,j)
                        } else if leftDistance < rightDistance {
                            answer.append(0)
                            handPosition.left = (i,j)
                        } else {
                            if 0 <= j && j <= 4 {
                                answer.append(0)
                                handPosition.left = (i, j)
                            } else {
                                answer.append(1)
                                handPosition.right = (i, j)
                            }
                        }
                    }
                }
            }
        }

    }
    return answer
}

func calculateDistance(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) -> Int {
    return abs(y1 - y2)
}


func manhattanDistance(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) -> Int {
    return abs(x1 - x2) + abs(y1 - y2)
}

print(solution("Q4OYPI"))
