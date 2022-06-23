//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/23.
//

import Foundation

// 정렬할 배열
var array: [Int] = [99, 2, 44, 98, -1, 0, 32, 77, 322, 56, 65]
var tmp: [Int] = [Int](repeating: 0, count: array.count)


func merge(_ start: Int, _ end: Int) {
    let mid = (start + end) / 2
    var leftIndex = start, rightIndex = mid

    for i in start..<end {
        if rightIndex == end {
            tmp[i] = array[leftIndex]
            leftIndex += 1
        } else if leftIndex == mid {
            tmp[i] = array[rightIndex]
            rightIndex += 1
        } else if array[leftIndex] <= array[rightIndex] {
            tmp[i] = array[leftIndex]
            leftIndex += 1
        } else {
            tmp[i] = array[rightIndex]
            rightIndex += 1
        }
    }

    for i in start..<end {
        array[i] = tmp[i]
    }
}

func mergeSort(_ start: Int, _ end: Int) {
    if end == start + 1 { return }
    let mid = (start + end) / 2
    mergeSort(start, mid)
    mergeSort(mid, end)
    merge(start, end)
}

mergeSort(0, array.count)

print(array)
