//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/07/01.
//  BOJ > 4673 > 셀프 넘버

import Foundation

func d() {
    var noneSelfNumbers = [Int]()
    for i in 1...10000 {
        let list = Array(String(i))
        var i = i
        for j in list {
            i += Int(String(j))!
        }
        noneSelfNumbers.append(i)
    }
    
    for selfNumber in 1...10000 {
        if !noneSelfNumbers.contains(selfNumber) {
            print(selfNumber)
        }
    }
    
}

d()
