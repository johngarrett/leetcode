

func strongPasswordChecker(_ password: String) -> Int {
    return 6 - Password(from: password).computeScore()
}

struct Password {
    enum StrengthWeight: Int {
        case invalidLength = -1,
            hasLowercase = 1,
            hasUppercase = 1,
            hasDigit = 1,
            hasThreeRepeats = -1
    }
    var hasValidLength: Bool { // cost: 6 - passwordCount
        6...20 ~= password.count 
    }

    var hasLowercase: Bool { // cost + 1
        true
    }
    var hasUppercase: Bool { // cost + 1
        true
    }
    var hasDigit: Bool { // cost: +1
        true
    }

    var hasThreeRepeats: Bool { // cost: -1
        false
    }

    let password: String
    init(from pw: String) {
        password = pw
    }

    func computeScore() -> Int {

        return 5
    }
}
print(strongPasswordChecker("a"))
print(strongPasswordChecker("aA1"))
print(strongPasswordChecker("1337C0d3"))
