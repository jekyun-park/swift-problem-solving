//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/05/07.
//

import Foundation

func solution(_ survey: [String], _ choices: [Int]) -> String {

    var scores: [String: Int] = ["R": 0, "T": 0, "C": 0, "F": 0, "J": 0, "M": 0, "A": 0, "N": 0]
    var answer = ""

    for result in zip(survey, choices) {

        let characters = result.0.map { String($0) }

        if result.1 == 1 {
            scores[characters.first!, default: 0] += 3
        } else if result.1 == 2 {
            scores[characters.first!, default: 0] += 2
        } else if result.1 == 3 {
            scores[characters.first!, default: 0] += 1
        } else if result.1 == 5 {
            scores[characters.last!, default: 0] += 1
        } else if result.1 == 6 {
            scores[characters.last!, default: 0] += 2
        } else if result.1 == 7 {
            scores[characters.last!, default: 0] += 3
        }
    }
    
    // rt/cf/jm/an
    
    if scores["R"]! < scores["T"]! {
        answer += "T"
    } else if scores["R"]! > scores["T"]! {
        answer += "R"
    } else {
        answer += "R"
    }
    
    if scores["C"]! < scores["F"]! {
        answer += "F"
    } else if scores["C"]! > scores["F"]! {
        answer += "C"
    } else {
        answer += "C"
    }
    
    if scores["J"]! < scores["M"]! {
        answer += "M"
    } else if scores["J"]! > scores["M"]! {
        answer += "J"
    } else {
        answer += "J"
    }
    
    if scores["A"]! < scores["N"]! {
        answer += "N"
    } else if scores["A"]! > scores["N"]! {
        answer += "A"
    } else {
        answer += "A"
    }

    return answer
}

print(solution(["AN", "CF", "MJ", "RT", "NA"], [5, 3, 2, 7, 5]))
