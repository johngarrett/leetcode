import Foundation 

enum PermittedCharacter: Character, CaseIterable {
    case negative = "-", positive = "+"
    case decimal = "."
    case exponent = "e"

    static func defaultSet() -> Set<Character> {
        Set(PermittedCharacter.allCases.map { $0.rawValue })
    }
}


func isNumber(_ s: String, using allowedCharacters: Set<Character> = PermittedCharacter.defaultSet()) -> Bool {
    let s = s.trimmingCharacters(in: .whitespacesAndNewlines)

    for character in s {
        if !allowedCharacters.contains(character) && !character.isNumber {
            print("\tinvalid character \(character) detected")
            return false
        }
    }

    guard s.count != 0 else {
        print("empty string after trimming")
        return false
    }
    
    print("incoming string: \(s)")

    if s.contains("e") {
        print("\thas exponent")
        guard s.locations(of: "e").count == 1 else {
            print("multiple exponents")
            return false
        }

        guard let lhs = s.before("e"), let rhs = s.after("e") else {
            print("missing lhs or rhs")
            return false
        }

        print("\tlhs: \(lhs)")
        print("\trhs: \(rhs)")

        return isNumber(lhs, using: PermittedCharacter.defaultSet().subtracting(["e"]))
        && isNumber(rhs, using: PermittedCharacter.defaultSet().subtracting(["e", "."]))
    }

    for character in allowedCharacters.subtracting(Set(["e"])) {
        guard s.locations(of: character).count <= 1 else {
            print("multiple locations of \(character)")
            return false
        }
    }

    if s.contains("+") {
        print("\t has +")
        guard s.before("+") == nil else {
            print("stuff preceeding before the +")
            return false
        }
        guard let rhs = s.after("+") else {
            print("trailing +")
            return false
        }

        print("\trhs: \(rhs)")

        return isNumber(rhs, using: PermittedCharacter.defaultSet().subtracting(["+", "-"]))
    }
    
    if s.contains("-") {
        print("\t has -")
        guard s.before("-") == nil else {
            print("stuff preceeding the -")
            return false
        }
        guard let rhs = s.after("-") else {
            print("trailing -")
            return false
        }

        print("\trhs: \(rhs)")

        return isNumber(rhs, using: PermittedCharacter.defaultSet().subtracting(["+", "-"]))
    }

    if s.contains(".") {
        print("\t has .")
        if s.before(".") == nil && s.after(".") == nil {
            print("both sides are empty")
            return false
        }

        let lhs = s.before(".") ?? "0"
        let rhs = s.after(".") ?? "0"

        print("\tlhs: \(lhs)")
        print("\trhs: \(rhs)")

        return isNumber(lhs, using: PermittedCharacter.defaultSet().subtracting(["e", "."]))
        && isNumber(rhs, using: PermittedCharacter.defaultSet().subtracting([".", "+", "-"]))
    }

    return true
}

extension String {
    func locations(of character: Character) -> [String.Index] {
        self.indices.filter { self[$0] == character }
    }

    func before(_ character: Character) -> String? {
        let splitSelf = self.split(separator: character)
        if let first = splitSelf.first {
            if self.last == character {
                return String(first)
            }
            return String(first).count == self.count - 1 ? nil : String(first)
        } else {
            return nil
        }
    }
    func after(_ character: Character) -> String? {
        let splitSelf = self.split(separator: character)
        if self.before(character) == nil, let first = splitSelf.first {
            return String(first)
        } else {
            return splitSelf.count == 2 ? String(splitSelf[1]) : nil
        }
    }
}

[
    "1",
    "1e20",
    "1e",
    "e",
    "e2",
    "5e22.0",
    "+31.12",
    "95a54e53",
    "--6",
    "+-3",
    "6e-1",
    "--3",
    "-3+",
    "..2",
    "e.7e5"
].forEach {
    print("\($0) isNumber? \t \(isNumber($0))\n\n")
}

