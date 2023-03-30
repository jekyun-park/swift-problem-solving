import Foundation

func solution(_ array:[Int], _ height:Int) -> Int { array.filter { $0 > height }.count }