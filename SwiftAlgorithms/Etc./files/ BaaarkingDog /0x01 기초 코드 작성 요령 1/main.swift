//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/02/22.
//  BaaarkingDog > 0x01 강 > 기초 코드 작성 요령 1

import Foundation

// 문제1
// O(N)
func example1(_ N: Int) -> Int {
    var answer: Int = 0
    for i in 1...N {
        if i % 3 == 0 || i % 5 == 0 {
            answer += i
        }
    }
    return answer
}

//print(example1(16))
//print(example1(34567))
//print(example1(27639))

// 문제2
// O(N^2)
func example2(_ array: [Int], _ N: Int) -> Int {

    for i in 0...N - 2 {
        for j in i + 1...N - 1 {
            if array[i] + array[j] == 100 {
                return 1
            }
        }
    }

    return 0
}

//print(example2([1,52,48], 3))
//print(example2([50,42], 2))
//print(example2([4,13,63,87], 4))

// 문제3

func example3(_ N: Int) -> Int {
    let x = sqrt(Double(N))

    if x.truncatingRemainder(dividingBy: 1) == 0 {
        return 1
    } else {
        return 0
    }
}

//print(example3(9))
//print(example3(693953651))
//print(example3(756580036))

func example4(_ N:Int) -> Int {
    
    var value = 1
    
    while 2*value <= N {
        value *= 2
    }
    
    return value
}

//print(example4(5))
//print(example4(97615282))
//print(example4(1024))
