import Foundation

func solution(_ common:[Int]) -> Int {
    
    if common[1] - common[0] == common[2] - common[1] {
        let distance = common[1] - common[0]
        return common.last! + distance
    } else {
        let ratio = (common[1] / common[0])
        return common.last! * ratio
    }
}