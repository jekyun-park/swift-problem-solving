//
//  main.swift
//  AlgorithmStudy
//
//  Created by 박제균 on 2021/11/30.
//

import Foundation

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
//        var newK : Int = k
//        while (newK>0) {
//            let popedNum : Int = nums.popLast()!
//            nums.insert(popedNum, at: 0)
//            newK -= 1
//        }
        let n = nums.count
        let times = k % n
           
        nums = Array(nums[n-times..<n]) + Array(nums[0..<n-times])
    }
}
