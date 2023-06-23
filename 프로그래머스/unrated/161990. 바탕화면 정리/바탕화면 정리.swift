import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    
    let wallpaper = wallpaper.map { Array($0).map { String($0) } }
    
    return findFiles(wallpaper)
}

func findFiles(_ wallpaper: [[String]]) -> [Int] {
    
    var files: [(Int, Int)] = []
    var answer = [Int]()
    let w = wallpaper[0].count
    let h = wallpaper.count
    
    for i in 0..<h {
        for j in 0..<w {
            if wallpaper[i][j] == "#" {
                files.append((i, j))
            }
        }
    }
    
    if files.count == 1 {
        return [files[0].0, files[0].1, files[0].0 + 1, files[0].1 + 1]
    } else {
        
        files.sort { $0.0 < $1.0 }
        
        answer.append(files.first!.0)
        
        files.sort { $0.1 < $1.1 }
        
        answer.append(files.first!.1)
        
        files.sort { $0.0 > $1.0 }
        
        answer.append(files.first!.0 + 1)
        
        files.sort { $0.1 > $1.1 }
        
        answer.append(files.first!.1 + 1)
        
        return answer
    }
}

