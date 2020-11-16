
func letterCombinations(_ digits: String) -> [String] {
    return ["hello", "world"]
}

func letters(for digit: Int) -> String {
    let base = 97
    switch(digit) {
    case 0:
        return "_"
    case 1:
        return ""
    case _ where digit > 9:
        return ""
    default:
    let s = [(digit - 2)...(digit + 1)]
        .compactMap { return UnicodeScalar($0) }

    return ""
    }
}

print(letters(for: 9))
print(letterCombinations("23"))
print(letterCombinations(""))
print(letterCombinations("2"))
