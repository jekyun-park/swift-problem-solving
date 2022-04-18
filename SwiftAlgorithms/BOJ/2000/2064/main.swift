//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/03/13.
//  BOJ > 2064 > IP 주소

import Foundation

let n = Int(readLine()!)!

var ipAddresses: [String] = []

for _ in 0..<n {
    ipAddresses.append(readLine()!)
}

// ip 주소에 서브넷 마스크를 &연산 하면 해당 컴퓨터의 네트워크 주소가 된다.
