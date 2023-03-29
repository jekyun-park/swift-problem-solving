import Foundation

func solution(_ myStr:String, _ n:Int) -> [String] {
    
    var slice = String.init()
    var answer = [String]()
    
    for (index, value) in myStr.enumerated() {
        slice.append(value)
        if (index+1) % n == 0 { 
            answer.append(slice)
            slice = String.init() 
        } else if index == myStr.count-1 {
            answer.append(slice)
        }
    }
    
    return answer
}