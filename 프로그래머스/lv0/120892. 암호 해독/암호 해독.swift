import Foundation

func solution(_ cipher:String, _ code:Int) -> String {
    
    var answer: String = ""

    for i in 0..<cipher.count {
        if (i+1) % code == 0 { answer += String(cipher[String.Index(encodedOffset: i)]) }
    }

    return answer
}