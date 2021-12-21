//
//  new_main.swift
//  AlgorithmStudy
//
//  Created by 박제균 on 2021/12/06.
//

import Foundation

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    
    var priceDictionary : [String:Int] = [:]
    var recommendDictionary : [String:String] = [:]
    
    for i in 0 ..< enroll.count {
        priceDictionary[enroll[i]] = 0
        recommendDictionary[enroll[i]] = referral[i]
    }

    for i in 0 ..< seller.count {
        var tenPercentProfit : Int = amount[i] * 100
        var recommender : String = seller[i]
        
        while (recommender != "-") && (tenPercentProfit > 0) {
            priceDictionary[recommender]! += tenPercentProfit - tenPercentProfit/10
            recommender = recommendDictionary[recommender]!
            tenPercentProfit /= 10
        }
    }
    
    return enroll.map {priceDictionary[$0]!}
}



print(solution(["john", "mary", "edward", "sam", "emily", "jaimie", "tod", "young"], ["-", "-", "mary", "edward", "mary", "mary", "jaimie", "edward"], ["young", "john", "tod", "emily", "mary"], [12, 4, 2, 5, 10]))
