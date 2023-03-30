import Foundation

func solution(_ myString:String, _ letter:String) -> String {
    return myString.filter { $0 != Character(letter) }
}