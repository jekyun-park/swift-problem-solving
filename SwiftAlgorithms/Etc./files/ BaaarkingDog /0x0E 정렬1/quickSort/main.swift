//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/23.
//

import Foundation

// 정렬하고자 하는 배열
var array: [Int] = [10,7,-8,22,1,23,44,36,98,33,22,31]
let n = array.count

func quickSort(_ start: Int, _ end: Int) {
    // base condition, 수열의 길이가 1 이하이면 종료
    if end <= start + 1 { return }
    let pivot = array[start]
    var left = start + 1
    var right = end - 1
    
    while true {
        while (left <= right) && (array[left] <= pivot) {
            left += 1
        }
        while (left <= right) && (array[right] >= pivot) {
            right -= 1
        }
        if left>right { break }
        array.swapAt(left, right)
    }
    array.swapAt(start, right)
    quickSort(start, right)
    quickSort(right+1, end)
}

quickSort(0, n)

print(array)
