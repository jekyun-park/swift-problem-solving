//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/12.
//


import Foundation

func solution(_ n: Int, _ plans: [String], _ clients: [String]) -> [Int] {

    var plansToInt: [[Int]] = []
    var answer: [Int] = []

    for (index, plan) in plans.enumerated() {
        if index == 0 {
            plansToInt.append(plan.split(separator: " ").map { Int($0)! })
        } else {
            plansToInt.append(plan.split(separator: " ").map { Int($0)! } + plansToInt[0])
        }
    }

    for client in clients {
        let clientInformation = client.split(separator: " ").map { Int($0)! }
        let dataForClient = clientInformation.first!
        let serviceForClient = clientInformation[1...]

        for (index, value) in plansToInt.enumerated() {

            if value.first! >= dataForClient && Set(value[1...]).isSuperset(of: Set(serviceForClient)) {
                answer.append(index + 1)
                break
            }
            
            if index == plansToInt.count - 1 {
                answer.append(0)
            }
        }
    }

    return answer
}
