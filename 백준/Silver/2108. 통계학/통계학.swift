import Foundation

let N = Int(readLine()!)!
var numbersDictionary = Dictionary<Double, Int>()
var numbersArray = [Double]()

for _ in 0..<N {
    let number = Double(readLine()!)!
    numbersDictionary[number, default: 0] += 1
    numbersArray.append(number)
}

numbersArray.sort(by: <)
let numbers = numbersDictionary.keys.sorted(by: <)
let mode = numbersDictionary.filter { $0.value == numbersDictionary.values.max() }.keys.sorted(by: <)

print(Int(round(numbersArray.reduce(0, +)/Double(N))))
print(Int(numbersArray[N/2]))
print(mode.count == 1 ? Int(mode[0]) : Int(mode[1]))
print(Int(numbers.last! - numbers.first!))