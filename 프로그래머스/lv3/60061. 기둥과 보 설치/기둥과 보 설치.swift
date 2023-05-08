import Foundation

func solution(_ n:Int, _ buildFrame:[[Int]]) -> [[Int]] {
    
    var result: [[Int]] = []
    var answer = Set<[Int]>()
    
    for command in buildFrame {
        let x = command[0], y = command[1], a = command[2], b = command[3]
        
        if b == 0 { // 삭제
            answer.remove([x, y, a])
            if !check(answers: answer) {
                answer.insert([x, y, a])
            }
        }
        
        if b == 1 { // 설치
            answer.insert([x, y, a])
            if !check(answers: answer) {
                answer.remove([x, y, a])
            }
        }
    }
    
    result = answer.map { $0 }
    
    return result.sorted { a, b in
        if a[0] == b[0] {
            if a[1] == b[1] {
                return a[2] < b[2]
            } else {
                return a[1] < b[1]
            }
        } else {
            return a[0] < b[0]
        }
    }
}

func check(answers: Set<[Int]>) -> Bool {
 
    for info in answers {
        let x = info[0], y = info[1], a = info[2]
        if a == 0 { // 기둥일 때
            if y == 0 || answers.contains([x-1, y, 1]) || answers.contains([x, y, 1]) || answers.contains([x, y-1, 0]) {
                continue
            }
            return false
        } else if a == 1 { // 보 일때
            if answers.contains([x, y-1, 0]) || answers.contains([x+1, y-1, 0]) || (answers.contains([x-1, y, 1]) && answers.contains([x+1, y, 1])) {
                continue
            }
            return false
        }
    }
    return true
}