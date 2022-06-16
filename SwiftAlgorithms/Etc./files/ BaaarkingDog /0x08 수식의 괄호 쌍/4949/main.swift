//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/06/13.
//

import Foundation

while true {

    let sentence = readLine()!
    if sentence == "." { break }

    var stack: [String] = []
    var isValid: Bool = true

    for char in sentence {
        
        // 여는 괄호가 나오면 스택에 추가
        if char == "[" || char == "(" {
            stack.append(String(char))
            // 닫는 괄호가 나오면
        } else if char == ")" || char == "]" {
            // 닫는 괄호가 나왔는데 스택이 비어있다면 올바르지 않음
            if stack.isEmpty { isValid = false; break }
            // 닫는 괄호가 나왔는데 짝이 맞으면 pop
            if (char == ")" && stack.last! == "(") || (char == "]" && stack.last! == "[") {
                stack.removeLast()
            // 닫는 괄호가 나왔는데 짝이 맞지 않는경우 올바르지 않음
            } else {
                isValid = false
                break
            }
        }
    }
    // 다 돌고 나서 스택이 비어있지 않다면 올바르지 않음
    if !stack.isEmpty { isValid = false }
    isValid ? print("yes") : print("no")
}
