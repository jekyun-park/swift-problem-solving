//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/11.
//

import Foundation

func solution(_ s: String) -> Int {
    var answer: String = s

    let dictionary: [String: Int] = ["zero": 0, "one": 1, "two": 2, "three": 3, "four": 4, "five": 5, "six": 6, "seven": 7, "eight": 8, "nine": 9]


    for (number, _) in dictionary {
        if answer.contains(number) {
            answer = answer.replacingOccurrences(of: number, with: "\(dictionary[number]!)")
        }

    }

    return Int(answer)!
}

print(solution("one4seveneight")) //1478
print(solution("23four5six7")) //234567
print(solution("23four5six7")) //234567
print(solution("123"))
