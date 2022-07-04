//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/07/01.
//  Programmers > 2018 KAKAO BLIND RECRUITMENT > [3차] 압축
//  Reference: https://jeonyeohun.tistory.com/214

func solution(_ msg:String) -> [Int] {
    
    var indexDictionary: [String:Int] = ["A":1,"B":2,"C":3,"D":4,"E":5,"F":6,"G":7,"H":8,"I":9,"J":10,"K":11,"L":12,"M":13,"N":14,"O":15,"P":16,"Q":17,"R":18,"S":19,"T":20,"U":21,"V":22,"W":23,"X":24,"Y":25,"Z":26]
    
    var tempString = ""
    var answer = [Int]()
    var message = msg.map { String($0) }
    
    while !message.isEmpty {
        // 현재 입력을 추가
        tempString += message.removeFirst()
        
        // 메시지를 다 봤다면 마지막으로 처리되지 않은 글자의 색인 번호를 정답에 추가해준다.
        guard let next = message.first else {
//            print(message,tempString)
            answer.append(indexDictionary[tempString]!)
            break
        }
        
        if let index = indexDictionary[tempString], indexDictionary[tempString + next] == nil {
            // 현재 입력단어는 사전에 있고,다음 글자까지 포함한 단어는 사전에 없다면 정답에 현재 입력단어의 색인 번호를 추가하고 다음 단어는 사전에 등록
            answer.append(index)
            indexDictionary[tempString + next] = indexDictionary.values.max()!+1
            // 입력 초기화
            tempString = ""
        }
        
    }
    
    return answer
}
