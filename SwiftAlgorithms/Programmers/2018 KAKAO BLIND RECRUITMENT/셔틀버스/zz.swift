//
//  main.swift
//  SwiftAlgorithms
//
//  Created by 박제균 on 2022/02/10.
// Programmers : 2018 KAKAO BLIND RECRUITMENT [1차] 셔틀버스

import Foundation

// 09:00 부터 총 n회 t분 간격으로 역에 도착, 하나의 셔틀에는 최대 m명 탈 수 있음
// n : 셔틀 오는 횟수
// t: 셔틀 오는 간격
// m: 셔틀 수용인원

func solution(_ n: Int, _ t: Int, _ m: Int, _ timetable: [String]) -> String {

    let shuttleTimeTable = makeShuttleBusTimeTable(n, t)
    let crews = timetable.map { convertToMinute($0) }.sorted()
    let numberOfCrew = crews.count
    var currentCrewIndex: Int = 0
    var answer: Int = 0

    for shuttleTime in shuttleTimeTable {
        var count: Int = 0
        while (currentCrewIndex < numberOfCrew) && (count < m) && crews[currentCrewIndex] <= shuttleTime {
            currentCrewIndex += 1
            count += 1
        }
        answer = count < m ? shuttleTime : crews[currentCrewIndex - 1] - 1

        if currentCrewIndex > numberOfCrew { break }
    }

    let hour = String(format: "%02d", answer / 60)
    let minute = String(format: "%02d", answer % 60)

    return "\(hour):\(minute)"
}

func convertToMinute(_ a: String) -> Int {
    let stringArray = Array(a)
    let hour = Int(String(stringArray[..<2]))!
    let minute = Int(String(stringArray[3...]))!

    return hour * 60 + minute
}


func makeShuttleBusTimeTable(_ n: Int, _ t: Int) -> [Int] {

    var shuttleTimeTable: [Int] = []

    let startMinute: Int = 9 * 60
    for i in 0..<n {
        shuttleTimeTable.append(startMinute + t * i)
    }
    return shuttleTimeTable
}


//print(solution(1, 1, 5, ["08:00", "08:01", "08:02", "08:03"]))
//print(solution(2, 10, 2, ["09:10", "09:09", "08:00"]))
