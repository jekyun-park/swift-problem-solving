import Foundation

func solution(_ myString:String) -> String {
    return myString.map { String($0).lowercased() }.sorted(by: <).joined()
}