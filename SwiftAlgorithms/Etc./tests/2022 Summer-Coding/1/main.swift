//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/05/08.
//

import Foundation

func solution(_ atmos: [[Int]]) -> Int {

    var continuousDay = 0
    var answer = 0

    for (index, day) in atmos.enumerated() {
        if continuousDay == 3 {
            // 폐기
            continuousDay = 0
        }

        if dust(day.first!) == 3 && microDust(day.last!) == 3 {
            // 사용중 아니라면 사용하고 버림
            if continuousDay == 0 {
                answer += 1
            } else { // 사용중이라면 폐기
                continuousDay = 0
            }
        } else if dust(day.first!) >= 2 || microDust(day.last!) >= 2 {
            // 사용중이라면 재사용
            if continuousDay > 0 {
                continuousDay += 1
                // 사용중 아니라면
            } else if continuousDay == 0 {
                continuousDay = 1
                answer += 1
            }
            // 둘다 매우나쁜날
        } else {
            if continuousDay > 0 {
                continuousDay += 1
                // 사용중 아니라면
            }
        }
    }
    return answer
}

func dust(_ n: Int) -> Int {
    if n <= 30 {
        return 0
    } else if 31 <= n && n <= 80 {
        return 1
    } else if 81 <= n && n <= 150 {
        return 2
    } else if 151 <= n {
        return 3
    } else { return -1 }
}

func microDust(_ n: Int) -> Int {
    if n <= 15 {
        return 0
    } else if 16 <= n && n <= 35 {
        return 1
    } else if 36 <= n && n <= 75 {
        return 2
    } else if 76 <= n {
        return 3
    } else { return -1 }
}

// print(solution([[140, 90], [177, 75], [95, 45], [71, 31], [150, 30], [80, 35], [72, 33], [166, 81], [151, 75]]))
