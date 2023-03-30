import Foundation

func solution(_ s:String) -> String {
    var dictionary = [String: Int]()
    
    for character in Array(s) {
        dictionary[String(character), default: 0] += 1
    }
    
    
    return dictionary.filter { $0.value == 1 }.keys.sorted(by: <).joined()
}