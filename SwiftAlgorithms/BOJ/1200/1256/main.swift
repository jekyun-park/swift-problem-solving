//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/01/17.
//

import Foundation

var line = readLine()!.split(separator:" ")

var N = Int(line[0])!
var M = Int(line[1])!
var K = Int(line[2])!

//var dp = Array(repeating: Array(repeating: 1, count: M+1), count: N+1)
//
//for i in 1...N {
//    for j in 1...M {
//        dp[i][j] = dp[i-1][j] + dp[i][j-1]
//    }
//}
//
//if dp[N][M] < K {
//        print(-1)
//} else {
//    var answer = ""
//    while true {
//        if N == 0 || M == 0 {
//            answer += String(repeating: "z", count: M)
//            answer += String(repeating: "a", count: N)
//            break
//        }
//
//        let num = dp[N-1][M]
//
//        if K <= num {
//            answer += "a"
//            N -= 1
//        } else {
//            answer += "z"
//            M -= 1
//            K -= num
//        }
//    }
//    print(answer)
//}
//

func solve(_ a: Int, _ z: Int, _ target:Int) -> String {
    if a == 0 || z == 0 {
        return String(repeating: "a", count: a) + String(repeating: "z", count: z)
    }
    
    let startsWithA: Int = comb
    
    
    return
}
