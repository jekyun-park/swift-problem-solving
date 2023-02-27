import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    
    var answer = [Int]()
    var termsDictionary = [String: Int]()
    let calendar = Calendar(identifier: .gregorian)
    
    terms.forEach {
        let splitted = $0.split(separator: " ")
        termsDictionary[String(splitted[0]), default:0] = Int(String(splitted[1]))!
    }
    
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy.MM.dd"
    
    for (index, privacy) in privacies.enumerated() {
        let splitted = privacy.split(separator: " ")
        
        guard let date = dateFormatter.date(from: String(splitted[0])) else { return [] }
        
        guard let calculatedDate = calendar.date(byAdding: .month, value:termsDictionary[String(splitted[1]), default: 0], to: date) else { return [] }
        guard let today = dateFormatter.date(from: today) else { return [] }
        
        if today >= calculatedDate {
            answer.append(index+1)
        }
        
    }

    return answer.sorted()
}