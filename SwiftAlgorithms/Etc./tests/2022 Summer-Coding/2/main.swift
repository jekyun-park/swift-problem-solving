//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/05/08.
//

import Foundation

func solution(_ rooms: [String], _ target: Int) -> [String] {

    var roomsDictionary: [String: [Int]] = [:]
    var answer: [String] = []

    for room in rooms {
        let splitted = room.split(separator: "]")
        let people = splitted.last!.split(separator: ",").map { String($0) }
        
        people.forEach {
            roomsDictionary[$0,default: []].append(Int(splitted.first!.dropFirst())!)
        }
    }
    
    let new = roomsDictionary.filter {
        !$0.value.contains(target)
    }.sorted {
        
        if $0.value.count == $1.value.count {
            var standard1 = Int.max
            var standard2 = Int.max
            $0.value.forEach {
                standard1 = min(standard1,abs($0-target))
            }
            
            $1.value.forEach {
                standard2 = min(standard2, abs($0-target))
            }
            
            if standard1 == standard2 {
                
                return $0.key < $1.key
            }
            
            return standard1 < standard2
        }
        
        return $0.value.count < $1.value.count
    }
    

    new.forEach {
        answer.append($0.key)
    }


    return answer
}

//print(solution(["[403]James", "[404]Azad,Louis,Andy", "[101]Azad,Guard"], 403))
