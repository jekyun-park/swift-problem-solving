import Foundation

func solution(_ myString:String) -> String {
    return myString.filter { !["a", "e", "i", "o", "u"].contains($0) }
}