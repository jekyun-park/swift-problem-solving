//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/12.
//

import Foundation

func solution(_ periods: [Int], _ payments: [[Int]], _ estimates: [Int]) -> [Int] {

    func isVIP(payment: Int, period: Int) -> Bool {

        if (900_000 <= payment) && period >= 24 {
            return true
        } else if (600_000 <= payment && payment < 900_000) && period >= 60 {
            return true
        }

        return false
    }

    // [이번 달은 VIP 아닌데 다음달에 VIP 되는 고객 수, 지금 VIP지만 다음 달에는 아닌 고객 수]

    var answer: [Int] = [0, 0]

    for (index, payment) in payments.enumerated() {

        let totalPayment = payment.reduce(0, +)
        let nextMonthTotalPayment = payment[1...].reduce(0,+)
        let period = periods[index]

        if !isVIP(payment: totalPayment, period: period) && isVIP(payment: nextMonthTotalPayment + estimates[index], period: period + 1) {
            answer[0] += 1
        } else if isVIP(payment: totalPayment, period: period) && !isVIP(payment: nextMonthTotalPayment + estimates[index], period: period + 1) {
            answer[1] += 1
        }
    }

    return answer
}
