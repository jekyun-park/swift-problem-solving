//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/30.
//  BOJ > 14889 > 스타트와 링크

import Foundation

let N = Int(readLine()!)!
var S = [[Int]]()
var answer = Int.max

for _ in 0..<N {
    S.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var people = Set(Array(0...N - 1))

func calculated(_ startTeam:[Int], _ linkTeam:[Int]) {
    var startTeamScore = 0
    var linkTeamScore = 0
    
    for i in 0..<(N/2) {
        for j in i+1..<(N/2) {
            startTeamScore += S[startTeam[i]][startTeam[j]] + S[startTeam[j]][startTeam[i]]
            linkTeamScore += S[linkTeam[i]][linkTeam[j]] + S[linkTeam[j]][linkTeam[i]]
        }
    }
    answer = min(answer, abs(startTeamScore-linkTeamScore))
}

func combination(of total: [Int], selectedCount: Int, current idx: Int, selected: [Int]) {
    if selectedCount == 0 {
        calculated(selected, Array(people.subtracting(Set(selected))))
    } else if idx == total.count {
        return
    } else {
        let newCombination = selected + [total[idx]]
        combination(of: total, selectedCount: selectedCount-1, current: idx+1, selected: newCombination)
        combination(of: total, selectedCount: selectedCount, current: idx+1, selected: selected)
    }
}

combination(of: Array(people), selectedCount: N/2, current: 0, selected: [])

print(answer)
