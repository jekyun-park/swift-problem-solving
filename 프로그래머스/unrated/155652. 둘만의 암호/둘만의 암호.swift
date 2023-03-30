import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    
    let alphabets = (0...25).map { String(UnicodeScalar($0+97)) }.filter { !skip.contains($0) }
    
    var answer = ""
    
    s.forEach {
        answer += alphabets[alphabets.index(alphabets.firstIndex(of:String($0))!, offsetBy: index) % alphabets.count]
    }
    
    return answer
}