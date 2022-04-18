//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/04/02.
//  WANTED Show me the Code > A > 물약 구매

import Foundation

let N = Int(readLine()!)!

var potionPrices = readLine()!.split(separator: " ").map { Int($0)! }
var discountInfo: [Int: [(potion: Int, price: Int)]] = [:]
var answer = 0

for i in 0..<N {
    let repeatNumber = Int(readLine()!)!
    discountInfo[i] = []
    for _ in 0..<repeatNumber {
        let discount = readLine()!.split(separator: " ").map { Int($0)! }
        discountInfo[i]?.append((discount[0] - 1, discount[1]))
    }
}

let sorted = discountInfo.sorted { a, b in

    var aTotalDiscountPrice = 0

    if a.value.count == 0 {
        aTotalDiscountPrice = 0
    } else {
        a.value.forEach {
            if potionPrices[$0.potion] - $0.price <= 0 {
                aTotalDiscountPrice += potionPrices[$0.potion] - 1
            } else {
                aTotalDiscountPrice += potionPrices[$0.potion] - $0.price
            }
        }
    }

    var bTotalDiscountPrice = 0
    if b.value.count == 0 {
        bTotalDiscountPrice = 0
    } else {
        b.value.forEach {
            if potionPrices[$0.potion] - $0.price <= 0 {
                bTotalDiscountPrice += potionPrices[$0.potion] - 1
            } else {
                bTotalDiscountPrice += potionPrices[$0.potion] - $0.price
            }
        }
    }
    
    return aTotalDiscountPrice > bTotalDiscountPrice ? aTotalDiscountPrice > bTotalDiscountPrice: a.value.count > b.value.count
}

for data in sorted {
    answer += potionPrices[data.key]
    data.value.forEach {
        potionPrices[$0.potion] = potionPrices[$0.potion] - $0.price
        if potionPrices[$0.potion] < 1 {
            potionPrices[$0.potion] = 1
        }
    }
}

print(answer)

// 예제는 맞는데? -> 3% 틀렸습니다.

