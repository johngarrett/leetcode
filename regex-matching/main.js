var isMatch = function(s, p) {
    const p_single = '.'
    const p_preceed = '*'

    if (p.indexOf(p_single) == -1 && p.indexOf(p_preceed) == -1) {
        return s == p
    }

    const charType = {
        CHAR: 0,
        P_SINGLE: 1,
        P_PRECEED: 2
    }

    const typeFor = (s) => {
        switch (s) {
        case p_single:
            return charType.P_SINGLE
        case p_preceed:
            return charType.P_PRECEED
        default:
            return charType.CHAR
        }
    }

    var matching = true


    for (const [index, char] of p.split('').entries()) {
        switch (typeFor(char)) {
            case charType.CHAR:
                matching = matching ? char == s[index] : false
                break
            case charType.P_SINGLE:
                matching = true
                break
            case charType.P_PRECEED:
                if (index > 0) {
                    
                }

            }
        console.log(char)
    }

    return true
}


console.log(isMatch("a", "a"));
console.log(isMatch("aa", "a"));
console.log(isMatch("aa", "a*"));
console.log(isMatch("ab", ".*"));
