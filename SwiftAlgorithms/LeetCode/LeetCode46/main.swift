//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/01/04.
//

import Foundation
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        
        var result : [[Int]] = []
        var visited : [Bool] = Array(repeating: false, count: nums.count)
        
        func permutation(_ arr: [Int]) {
            if arr.count == nums.count {
                result.append(arr)
            }
            
            for i in 0..<nums.count {
                if visited[i]{
                    continue
                } else {
                    visited[i] = true
                    permutation(arr+[nums[i]])
                    visited[i] = false
                }
            }
        }
        permutation([])
     
        return result
    }
}

let testCase = Solution().permute([1,2,3])
print(testCase)
