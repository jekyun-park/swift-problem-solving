import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    
    var dictionary = [String: Int]()
    
    for index in name.indices {
        dictionary[name[index]] = yearning[index] 
    }
    
    
    return photo.map { $0.map { dictionary[$0] ?? 0 }.reduce(0,+) }
}