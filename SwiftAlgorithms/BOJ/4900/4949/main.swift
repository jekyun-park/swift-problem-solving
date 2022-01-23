//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/01/16.
//

import Foundation

while true {
    
    let thisLine = readLine()!
    if thisLine == "." { break }
    var stack:[String.Element] = []
    var isBalanced: Bool = true
    
    for char in thisLine {
        
        if char == "(" || char == "[" {
            stack.append(char)
        } else if char == ")" {
            if stack.isEmpty || stack.last != "(" {
                isBalanced = false
                break
            }
            stack.removeLast()
        } else if char == "]" {
            if stack.isEmpty || stack.last != "[" {
                isBalanced = false
                break
            }
            stack.removeLast()
        }
    }
    if !stack.isEmpty { isBalanced = false }

    if isBalanced { print("yes") }
    else { print("no") }

}

    


