//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/23.
//

import Foundation

// 처음풀이
//func solution(_ dartResult:String) -> Int {
//
//    let dartResultArray = Array(dartResult)
//    var numbers: [Int] = []
//    for element in dartResultArray {
//        // 숫자라면
//        if let number = element.wholeNumberValue {
//            if let prev = numbers.last {
//             if number == 0 && prev == 1 {
//                 numbers.removeLast()
//                 numbers.append(10)
//                 continue
//             }
//            }
//            numbers.append(number)
//        }
//        // 숫자가 아니라면
//        if element == "S" {
//            guard let number = numbers.popLast() else { continue }
//            numbers.append(Int(pow(Double(number),1)))
//        } else if element == "D" {
//            guard let number = numbers.popLast() else { continue }
//            numbers.append(Int(pow(Double(number),2)))
//        } else if element == "T" {
//            guard let number = numbers.popLast() else { continue }
//            numbers.append(Int(pow(Double(number),3)))
//        } else if element == "*" {
//            if numbers.count == 1 {
//                guard let number = numbers.popLast() else { continue }
//                numbers.append(number*2)
//            } else {
//                guard let number = numbers.popLast() else { continue }
//                guard let prevNumber = numbers.popLast() else { continue }
//                numbers.append(prevNumber*2)
//                numbers.append(number*2)
//            }
//        } else if element == "#" {
//            guard let number = numbers.popLast() else { continue }
//            numbers.append(number*(-1))
//        }
//     }
//
//    return numbers.reduce(0,+)
//}

func solutionAfterRefactoring(_ dartResult: String) -> Int {

    let dartResultArray = Array(dartResult)

    let numbers = dartResult.split(whereSeparator: { $0.isLetter || $0 == "*" || $0 == "#" })
    let letters = dartResult.split(whereSeparator: { $0.isNumber })



    return 0
}
