import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    var key = key
    let n = lock.count
    let m = key.count
    
    var newLock = Array(repeating: Array(repeating: 0, count: n*3), count: n*3)
    
    for i in 0..<n {
        for j in 0..<n {
            newLock[i+n][j+n] = lock[i][j]
        }
    }
    
    for i in 0..<4 {
        
        let rotatedKey = rotate(key)
        key = rotatedKey
        
        for x in 0..<2*n {
            for y in 0..<2*n {
                
                for i in 0..<m {
                    for j in 0..<m {
                        newLock[x+i][y+j] += key[i][j]
                    }
                }
                
                if check(newLock) { return true }
                
                // 안맞으면 열쇠 다시 빼주기
                for i in 0..<m {
                    for j in 0..<m {
                        newLock[x+i][y+j] -= key[i][j]
                    }
                }
            }
        }
    }
    
    return false
}

// 시계방향으로 회전
func rotate(_ array: [[Int]]) -> [[Int]] {
    let n = array.count
    let m = array[0].count
    
    var result = Array(repeating: Array(repeating: 0, count: n), count: m)
    
    for i in 0..<n {
        for j in 0..<m {
            result[j][n-i-1] = array[i][j]
        }
    }
    return result
}

func check(_ array:[[Int]]) -> Bool {
    let length = array.count / 3
    
    for i in length..<length*2 {
        for j in length..<length*2 {
            if array[i][j] != 1 { return false }
        }
    }
    
    return true
}
