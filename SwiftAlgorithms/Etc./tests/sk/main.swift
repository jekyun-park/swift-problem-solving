//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/03/12.
//  FE / App 개발 부문 1차 코딩테스트

import Foundation

// 최소 비용으로 타겟 금액만큼의 동전 생성하는 문제
// 동전 6종류, 1,5,10,50,100,500
func solution1(_ money: Int, _ costs: [Int]) -> Int {

    var money = money
    var answer = 0

    let kindOfCoins = [1, 5, 10, 50, 100, 500]
    var coins: [(money: Int, cost: Int, ratio: Double)] = []

    for (index, value) in costs.enumerated() {
        coins.append((kindOfCoins[index], value, Double(value) / Double(kindOfCoins[index])))
    }

    coins.sort { $0.ratio < $1.ratio }

    for coin in coins {

        if money == 0 { break }

        answer += (money / coin.money) * coin.cost
        money -= (money / coin.money) * coin.money

    }

    return answer
}

//print(solution1(4578, [1, 4, 99, 35, 50, 1000]))

// 소용돌이 문제
func solution2(_ n: Int, _ clockwise: Bool) -> [[Int]] {
    
    var result: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    // 짝수
    if n%2 == 0 {
        // 시계
        if clockwise {
            
        // 반시계
        } else {
         
            
            
        }
    // 홀수
    } else {
        // 시계
        if clockwise {
            result[0] = Array(1...n-1)+[1]
            result[n-1] = (Array(1...n-1)+[1]).reversed()
        
        // 반시계
        } else {
         
            
            
        }
    }
    
//    print()
    
    return result
}
print(solution2(5, true))

// 격자 정사각형, 조건을 만족하는 경로의 개수
func solution3(_ width: Int, _ height: Int, _ diagonals: [[Int]]) -> Int {
    return 0
}


// 트리에서 조건을 만족하는 순서쌍의 개수
func solution4(_ n: Int, _ edges: [[Int]]) -> Int64 {
    return 0
}
