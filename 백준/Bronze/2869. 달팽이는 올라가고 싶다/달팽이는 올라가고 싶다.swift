import Foundation

let ABV = readLine()!.split(separator: " ").map { Int($0)! }
let a = ABV[0], b = ABV[1], v = ABV[2]
var answer = 0
let perNight = a - b

if (v - a) % perNight == 0 {
    print((v-a) / perNight + 1)
} else {
    print((v-a) / perNight + 2)
}