import Foundation

func solution(_ myString:String) -> String {
    
    var list = [String]()
    
    for string in Array(myString) {
        if !list.contains(String(string)) {
            list.append(String(string))
        }
    }
    
    return list.joined(separator: "")
}