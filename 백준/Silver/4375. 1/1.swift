while let n = readLine() { 
    var count = 0 
    var next = 1 
    
    while true {
        count += 1
        if next % Int(n)! == 0 { 
            print(count)
            break
        }else {
            next = ((next * 10) + 1)
            next %= Int(n)!
        }
        
    }
}