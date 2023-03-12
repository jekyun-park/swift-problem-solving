import Foundation

func solution(_ rsp:String) -> String {
    
    var answer = ""
    
    for turn in Array(rsp) {
        if turn == "0" {
            answer += "5"
        } else if turn == "2" {
            answer += "0"
        } else {
            answer += "2"
        }
    }
    
    return answer
}