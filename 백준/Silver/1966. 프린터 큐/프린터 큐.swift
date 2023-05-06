import Foundation

let tc = Int(readLine()!)!

for _ in 0..<tc {
    
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0], m = nm[1]
    let docs = readLine()!.split(separator: " ").map { Int($0)! }
    var queue: [(Int, Bool)] = []
    var count = 0
    
    for i in 0..<n {
        i == m ? queue.append((docs[i], true)) : queue.append((docs[i], false))
    }
    
    while !queue.isEmpty {
        
        let now = queue.first!.0
        if queue[1...].contains(where: { $0.0 > now }) {
            queue.append(queue.removeFirst())
        } else {
            let dequeued = queue.removeFirst()
            count += 1
            if dequeued.1 {
                print(count)
                break
            }
        }
    }
}