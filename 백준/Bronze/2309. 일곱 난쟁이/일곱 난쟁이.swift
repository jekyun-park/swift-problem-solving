import Foundation

var dwarfs = [Int]()

for _ in 0..<9 {
    dwarfs.append(Int(readLine()!)!)
}

func combination(start: Int, array: inout [Int]) {
    
    if array.count == 7 {
        if array.reduce(0, +) == 100 {
            array.sort(by: <)
            array.forEach { print($0) }
            exit(0)
        }
    }
    
    for i in start+1..<9 {
        array.append(dwarfs[i])
        combination(start: i, array: &array)
        let _ = array.popLast()
    }
}

var array = [Int]()

combination(start: -1, array: &array)