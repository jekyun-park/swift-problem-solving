//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/02/03.
//

import Foundation

func solution(_ info: [String], _ query: [String]) -> [Int] {

    var applicant: [Int: [String]] = [:]
    var answer: [Int] = []

    for i in 0..<info.count {
        let data = info[i].components(separatedBy: " ")
        applicant[i] = data
    }

    query.forEach {
        var temporaryApplicant = applicant

        let condition = parseQuery($0)

        for (n, item) in condition.enumerated().lazy {
            if item == "-" { continue }
            if n ==  4 { temporaryApplicant = temporaryApplicant.filter { Int($0.value[n])! >= Int(item)! } } else {
                temporaryApplicant = temporaryApplicant.filter { $0.value[n] == item }
            }
            
        }
        answer.append(temporaryApplicant.count)
    }

    return answer
}

func parseQuery(_ query: String) -> [String] {

    var result = query.components(separatedBy: " ")
    result.removeAll { $0 == "and" }

    return result
}


print(solution(["java backend junior pizza 150", "python frontend senior chicken 210", "python frontend senior chicken 150", "cpp backend senior pizza 260", "java backend junior chicken 80", "python backend senior chicken 50"], ["java and backend and junior and pizza 100", "python and frontend and senior and chicken 200", "cpp and - and senior and pizza 250", "- and backend and senior and - 150", "- and - and - and chicken 100", "- and - and - and - 150"]))
