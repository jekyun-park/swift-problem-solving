import Foundation

func solution(_ keyinput:[String], _ board:[Int]) -> [Int] {
    var answer = [0,0]
    let boardLimit = board.map { ($0-1)/2 }
    for input in keyinput {
        switch input {
            case "up":
                boardLimit[1] <= answer[1] ? (answer[1] += 0) : (answer[1] += 1)
            case "down":
                -boardLimit[1] >= answer[1] ? (answer[1] += 0) : (answer[1] -= 1)
            case "left":
                -boardLimit[0] >= answer[0] ? (answer[0] += 0) : (answer[0] -= 1)
            case "right":
                boardLimit[0] <= answer[0] ? (answer[0] += 0) : (answer[0] += 1)
            default:
                break
        }
    }
    return answer
}