import Foundation

func solution(_ num:Int, _ k:Int) -> Int {
    if let i = String(num).firstIndex(of: Character(String(k))) {
        let index: Int = String(num).distance(from: String(num).startIndex, to: i)
        return index+1
    } else {
        return -1 
    }
}