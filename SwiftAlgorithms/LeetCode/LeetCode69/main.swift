//
//  main.swift
//  AlgorithmStudy
//
//  Created by 박제균 on 2021/11/25.
//

import Foundation

class Solution {
    
    func mySqrt(_ x: Int) -> Int {
            
            var start:Int = 1
            var end: Int = x
            var mid:Int = (start+end)/2
            
            if x == 1 || x == 0 {
                return x
            }
            
            while start <= end {
                if mid * mid == x {
                    return mid
                } else if mid * mid > x {
                    end = mid - 1
                } else {
                    start = mid + 1
                }
                mid = (start+end)/2
            }
            
            return mid
        }
}

var test : Solution = Solution()

print(test.mySqrt(4))
