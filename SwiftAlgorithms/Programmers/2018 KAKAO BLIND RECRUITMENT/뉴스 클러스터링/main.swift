//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/05/29.
//  Programmers > 2018 KAKAO BLIND RECRUITMENT > 뉴스 클러스터링

import Foundation

func solution(_ str1: String, _ str2: String) -> Int {

    let str1Array = Array(str1.lowercased())
    let str2Array = Array(str2.lowercased())

    var str1Set = [String]()
    var str2Set = [String]()

    for i in 0..<str1.count - 1 {
        if isAlpha(str1Array[i]) && isAlpha(str1Array[i + 1]) {
            let newString = String(str1Array[i]) + String(str1Array[i + 1])
            str1Set.append(newString)
        }
    }

    for i in 0..<str2.count - 1 {
        if isAlpha(str2Array[i]) && isAlpha(str2Array[i + 1]) {
            let newString = String(str2Array[i]) + String(str2Array[i + 1])
            str2Set.append(newString)
        }
    }


    let intersection = Double(makeIntersection(str1Set, str2Set).count)
    let union = Double(makeUnion(str1Set, str2Set).count)
    var answer = Double(65536)
    
    if !(str1Set.count == 0 && str2Set.count == 0) {
        answer *= intersection/union
    }
    
    return Int(answer)
}


func isAlpha(_ character: Character) -> Bool {
    return character >= "a" && character <= "z"
}

func makeIntersection(_ arr1: [String], _ arr2: [String]) -> [String] {
    var result: [String] = []

    var temp = arr2

    arr1.forEach {
        if let index = temp.firstIndex(of: $0) {
            temp.remove(at: index)
            result.append($0)
        }
    }

    return result
}

func makeUnion(_ arr1: [String], _ arr2: [String]) -> [String] {
    var result: [String] = []
    
    var temp = arr2
    
    arr1.forEach {
        if let index = temp.firstIndex(of: $0) {
            temp.remove(at: index)
        }
    }
    result.append(contentsOf: temp)
    result.append(contentsOf: arr1)
    
    return result
}

print(solution("FRANCE", "french")) //16384
print(solution("handshake", "shake hands")) // 65536
print(solution("aa1+aa2", "AAAA12")) // 43690
print(solution("E=M*C^2", "e=m*c^2")) // 65536
