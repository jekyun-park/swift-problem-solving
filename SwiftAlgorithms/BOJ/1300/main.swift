//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/07/01.
//  BOJ > 1316

import Foundation

let N = Int(readLine()!)!
var words = [String]()
var answer = 0


for _ in 0..<N {
    words.append(readLine()!)
}

for word in words {
    // 단어를 살핌
    let wordArray = Array(word)
    var set = Set<Character>()
    var isGroupWord = true

    for i in 0..<wordArray.count {
        if i == 0 {
            set.insert(wordArray[i])
            continue
        }
        
        if wordArray[i] != wordArray[i-1] && set.contains(wordArray[i]) {
            isGroupWord = false
            break
        } else {
            set.insert(wordArray[i])
        }
    }

    if isGroupWord {
        answer += 1
    }
}
print(answer)
