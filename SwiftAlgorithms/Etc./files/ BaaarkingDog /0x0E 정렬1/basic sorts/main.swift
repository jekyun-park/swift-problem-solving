//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/23.
//

import Foundation

var array: [Int] = [-1,2,92,35,68,11,21]
let n = array.count

// 선택 정렬 (Selection Sort)

// 가장 오른쪽에 가장 큰값을 둬야 하므로 배열의 마지막부터 for문을 돈다.
//for i in (1..<n).reversed() {
//    var maxIndex = 0
//    for j in 1...i {
//        if array[maxIndex] < array[j] {
//            maxIndex = j
//        }
//    }
//    array.swapAt(maxIndex, i)
//}

// 버블 정렬 (Bubble Sort)

for i in 0..<n {
    for j in 0..<n-1-i {
        if array[j] > array[j+1] { array.swapAt(j, j+1) }
    }
}
        
print(array)
