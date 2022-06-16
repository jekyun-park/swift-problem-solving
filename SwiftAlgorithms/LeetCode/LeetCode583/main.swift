//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/14.
//

import Foundation

class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {

        var wordDictionary: [String: Int] = [:]

        Array(word1).map { String($0) }.forEach {
            wordDictionary[$0, default: 0] += 1
        }

        Array(word2).map { String($0) }.forEach {
            wordDictionary[$0, default: 0] -= 1
        }
        
        print(wordDictionary)
        
        return wordDictionary.values.filter { $0 != 0 }.map { abs($0) }.reduce(0,+)
    }
}

let a = Solution()

print(a.minDistance("sea", "ate"))
print(a.minDistance("leetcode", "etco"))
