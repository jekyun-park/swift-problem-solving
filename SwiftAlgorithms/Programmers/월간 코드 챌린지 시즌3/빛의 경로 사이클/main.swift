//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2021/12/27.
//

import Foundation

func solution(_ grid:[String]) -> [Int] {
    
    let separatedGrid = grid.map {$0.map {String($0)}} // grid를 2x2 배열로 분리
    
    let dir = ["u":(0,-1),"d":(0,1),"r":(1,0),"l":(-1,0)]
    let nextDir : [String:[String:String]] = ["L":["d":"r","r":"u","u":"l","l":"d"],"R":["d":"l","r":"d","u":"r","l":"u"],"S":["u":"u","d":"d","l":"l","r":"r"]]
    
    var answer :[Int] = []
    var visited = Array(repeating: Array(repeating: ["u":false,"d":false,"r":false,"l":false], count: separatedGrid.count), count: separatedGrid[0].count)
    
    for j in 0..<separatedGrid.count {
        for i in 0..<separatedGrid[0].count {
            for d in dir.keys {
                
                let startPoint = (i,j,d)
                var curPoint = startPoint
                
                var cnt:Int = 0
                
                while true {
                    if visited[j][i][d]! { break }
                    
                    visited[j][i][d] = true
                    cnt += 1
                    
                    let direction = separatedGrid[j][i]
                    curPoint.2 = nextDir[direction]![curPoint.2]!
                    
                    curPoint.0 += dir[curPoint.2]!.0 // i
                    curPoint.1 += dir[curPoint.2]!.1 // j
                    
                    if curPoint.0 < 0 {
                        curPoint.0 = separatedGrid[0].count - 1
                    } else {
                        curPoint.0 = curPoint.0 % separatedGrid[0].count
                    }
                    
                    if curPoint.1 < 0 {
                        curPoint.1 = separatedGrid.count - 1
                    } else {
                        curPoint.1 = curPoint.1 % separatedGrid.count
                    }
                    print(cnt)
                    print(curPoint)
                    print(startPoint)
                    if (curPoint == startPoint) && (cnt != 0) {
                        answer.append(cnt)
                        break
                    }
                    
                }
            }
        }
    }
    print(answer.sorted())
    return answer.sorted()
    
}



print(solution(["SL","LR"]))
