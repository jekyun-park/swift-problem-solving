import Foundation

let LC = readLine()!.split(separator: " ").map { Int($0)! }
let L = LC[0], C = LC[1]
let alphabets = readLine()!.split(separator: " ").map { String($0) }.sorted(by: <)

let vowel = ["a", "e", "i", "o", "u"]
var array = [String]()
var visited = Array(repeating: false, count: C)

func dfs(_ depth: Int, start: Int) {

  if depth == L {
    var isVowelContained = false
    var countConsonant = 0

    for v in vowel {
      if array.contains(v) {
        isVowelContained = true
        break
      }
    }

    for char in array {
      if !vowel.contains(char) {
        countConsonant += 1
      }
    }

    if countConsonant >= 2 && isVowelContained {
      print(array.joined())
      return
    }
  }

  for i in start..<C {
    if !visited[i] {
      visited[i] = true
      array.append(alphabets[i])
      dfs(depth+1, start: i)
      visited[i] = false
      array.popLast()
    }
  }

}

var depth = 0
dfs(depth, start: 0)