//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/04/02.
//  WANTED Show me the Code > C > 나는 정말 휘파람을 못 불어

import Foundation

let N = Int(readLine()!)!
let originalString = readLine()!
let string = originalString.map { String($0) }

var count: (W: Int, H: Int, E: Int) = (0, 0, 0)

for char in string {
    if char == "E" {
        count.E += 1
    } else if char == "W" {
        count.W += 1
    } else if char == "H" {
        count.H += 1
    }
}

// WHEE에는 W가 1개, H가 1개, E가 2개 + 그 이상
var characters = Array(repeating: "W", count: count.W) + Array(repeating: "H", count: count.H) + Array(repeating: "E", count: count.E)
let totalCount = count.H + count.W + count.E
if count.W < 1 || count.H < 1 {
    print(0)
    exit(0)
}
if count.E < 2 {
    print(0)
    exit(0)
}

func permutation<T>(_ elements: [T], _ k: Int) -> [[T]] {
    var result = [[T]]()
    var visited = [Bool](repeating: false, count: elements.count)

    func permut(_ now: [T]) {
        if now.count == k {
            result.append(now)
            return
        }

        for i in 0..<elements.count {
            if visited[i] == true { continue }
            visited[i] = true
            permut(now + [elements[i]])
            visited[i] = false
        }
    }
    permut([])
    return result
}


var answer = 0
let cases = permutation(Array(0..<totalCount), totalCount)

for situation in cases {

    var newString = ""

    situation.forEach {
        newString.append(characters[$0])
    }

    if newString.hasPrefix("WHEE") { answer += 1 }
}

print(answer)

/*
 
 문자열을 돌면서
 W H E E 를 체크해야함
 W가 안나오면 컷
 
 
 */
