import Foundation

func solution(_ board:[[Int]]) -> Int {
    
    var copiedBoard = board
    let dx = [0,0,-1,1,-1,1,-1,1]
    let dy = [-1,1,0,0,-1,-1,1,1]
    
    for i in 0..<board.count {
        for j in 0..<board[i].count {
            if copiedBoard[i][j] == 1 {
                for k in 0..<8 {
                    let nx = dx[k] + i
                    let ny = dy[k] + j
                    
                    guard 0 <= nx && nx < board.count else { continue }
                    guard 0 <= ny && ny < board.count else { continue }
                    
                    if copiedBoard[nx][ny] != 1 { copiedBoard[nx][ny] = 2 }
                }
            }
        }
    }
    
    return copiedBoard.flatMap { $0 }.filter { $0 == 0 }.count
}