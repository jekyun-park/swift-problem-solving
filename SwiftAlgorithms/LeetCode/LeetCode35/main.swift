// leetcode 35. Search Insert Position
//  main.swift
//  AlgorithmStudy
//
//  Created by 박제균 on 2021/11/25.
//

import Foundation

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        
        var start : Int = 0
        var end : Int = nums.count - 1
        var mid : Int = (start+end)/2
        
        
        
        while (end-start>=0) {
            if nums[mid]==target {
                return mid
            } else if nums[mid]>target {
                end = mid - 1
            } else {
                start = mid + 1
            }
            mid = (start+end)/2
        }
        
//        if nums[mid] > target {
//            return mid
//        } else {
//            return mid+1
//        }
        return start
    }
}


let a : Solution = Solution()
let b : Int = a.searchInsert([1,2,4,5],3)

print(b)



