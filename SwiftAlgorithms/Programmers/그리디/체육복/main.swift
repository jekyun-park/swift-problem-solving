//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/01/02.
//

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    
    var reserveClothesOverTwo :[Int] = reserve.sorted()
    var lostArray: [Int] = lost.sorted()
    
    for student in lostArray {
        if reserveClothesOverTwo.contains(student) {
            // 여벌 체육복이 있는데 잃어버린 학생
            reserveClothesOverTwo.remove(at: reserveClothesOverTwo.firstIndex(of: student)!)
            lostArray.remove(at: lostArray.firstIndex(of: student)!)
        }
    }
    
    for student in reserveClothesOverTwo {
        
        if lostArray.contains(student-1) {
            lostArray.remove(at: lostArray.firstIndex(of: student-1)!)
            reserveClothesOverTwo.remove(at: reserveClothesOverTwo.firstIndex(of: student)!)
        } else if lostArray.contains(student+1) {
            lostArray.remove(at: lostArray.firstIndex(of: student+1)!)
            reserveClothesOverTwo.remove(at: reserveClothesOverTwo.firstIndex(of: student)!)
        } else {
            continue
        }
    }
    
    
    print(reserveClothesOverTwo)
    print(lostArray)
    return n-lostArray.count
}

print(solution(5,[2,4], [5,3]))
