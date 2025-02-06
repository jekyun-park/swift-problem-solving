let input = readLine()!

func ROT13(_ input: String) -> String {
    return input.map { character -> String in
        if let asciiValue = character.asciiValue {
            switch character {
            case "A"..."Z":
                return String(Character(UnicodeScalar((asciiValue - 65 + 13) % 26 + 65)))
            case "a"..."z":
                return String(Character(UnicodeScalar((asciiValue - 97 + 13) % 26 + 97)))
            default: return String(character)
            }
        }
        return String(character)
    }.joined()
}

print(ROT13(input))