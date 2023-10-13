func solution(_ a:Int, _ b:Int) -> String {
    let days = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
    var sumOfDays = 0
    
    for i in 1..<a {
        switch i {
            case 1, 3, 5, 7, 8, 10, 12:
                sumOfDays += 31
            case 2:
                sumOfDays += 29
            default:
                sumOfDays += 30
        }
    }
    
    return days[(sumOfDays + b) % 7]
}