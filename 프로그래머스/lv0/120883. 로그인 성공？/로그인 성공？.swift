import Foundation

func solution(_ id_pw:[String], _ db:[[String]]) -> String {
    
    var dbDictionary: [String: String] = [:]
    
    for user in db {
        dbDictionary[user[0]] = user[1]
    }
    
    if let userPassword = dbDictionary[id_pw[0]] {
        if userPassword == id_pw[1] {
            return "login"
        } else {
            return "wrong pw"  
        } 
    } else {
        return "fail"
    }
}