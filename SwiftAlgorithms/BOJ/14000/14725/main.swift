//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/04/17.
//  BOJ > 14725 > 개미굴

import Foundation

let N = Int(readLine()!)!
var info: [[String]] = []
var dictionary: [String: [[(name: String, floor: Int)]]] = [:]

for _ in 0..<N {
    info.append(readLine()!.split(separator: " ")[1...].map { String($0) })
}

for data in info {
    var line: [(String, Int)] = []
    for (index, cave) in data[1...].enumerated() {
        line.append((cave, index + 1))
    }
    dictionary[data.first!, default: []].append(line)

}

dictionary.sorted { a, b in
    a.key < b.key
}.forEach {
    print($0.key)
    $0.value.sorted { a, b in
        return a.first!.name < b.first!.name
    }.forEach {
        $0.forEach { (name: String, floor: Int) in
            print(String(repeating: "--", count: floor) + name)
        }
    }
}


