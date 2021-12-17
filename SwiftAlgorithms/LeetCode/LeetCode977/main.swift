//
//  main.swift
//  AlgorithmStudy
//
//  Created by 박제균 on 2021/11/30.
//

import Foundation

class Solution {
//    func sortedSquares(_ nums: [Int]) -> [Int] {
//        var squaresNums:[Int] = []
//
//        squaresNums.append(contentsOf:nums.map { a in
//            return a*a
//        } )
//
//        squaresNums.sort()
//        return squaresNums
//    }
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var newNums:[Int] = nums.map { $0 * $0 }
        newNums.sort()
        return newNums
    }
}

var a : Solution = Solution()

print(a.sortedSquares([-4,-1,0,3,10]
))
