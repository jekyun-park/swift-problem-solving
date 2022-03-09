//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/03/08.
//

import Foundation

class Solution {
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]

    func solve(_ board: inout [[Character]]) {

        for i in 0..<board.count {
            for j in 0..<board[0].count {
                bfs(&board, row: i, column: j)
            }
        }
    }

    func bfs(_ board: inout [[Character]], row: Int, column: Int) {
        var queue: [[Int]] = []
        var visited: Set < [Int] > = []
        
        queue.append([row,column])
        var idx = 0
        
        while idx < queue.count {
            
            let x = queue[idx][0], y = queue[idx][1]
            
            for i in 0..<4 {
                let nx = x+dx[i]
                let ny = y+dy[i]
                
                if nx < 0 || nx >= board.count || ny < 0 || ny >= board.count { continue }
                
                if board[nx][ny] == "X" { continue }
                
                if visited.contains([nx,ny]) { continue }
                
                board[ny][ny] = "X"
                visited.update(with: [nx,ny])
                queue.append([nx,ny])
            }
            idx += 1
        }
    }
}

let a = Solution()
//a.solve([["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]])
