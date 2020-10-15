var isMatch = function(s, p) {
    const p_single = '.'
    const p_preceed = '*'


    const equal = (l, r) => {
        if (r == undefined || l == undefined) {
            return false
        }
        if (r == p_single || l == p_single) {
            return true
        }
        return l == r
    }

    if (p.indexOf(p_single) == -1 && p.indexOf(p_preceed) == -1) {
        return s == p
    }

   

    // expand all wild cards
    index = p.indexOf(p_preceed)
    while (index != -1) {
        preceeding = p[index - 1]
        if (!equal(s[index - 1], preceeding)) {
            p = p.slice(0, index - 1) + p.slice(index + 1)
        } else {
            while(equal(s[index], preceeding)) {
                p = p.slice(0, index) + s[index] + p.slice(index)
                index++
            }

            index = p.indexOf(p_preceed)
            if (index != -1) {
                p = p.slice(0, index) + p.slice(index + 1)
            }

        }
        index = p.indexOf(p_preceed)
    }

    // replace all . with their corresponding char
    index = p.indexOf(p_single)
    while (index != -1) {
        p = p.split('')
        p[index] = s[index]
        p = p.join('')
        index = p.indexOf(p_single)
    }

    return s == p
}

console.log("ba c*ba: " + isMatch("ba", "c*ba"));
console.log("a a: " + isMatch("a", "a"));
console.log("aa a: " + isMatch("aa", "a"));
console.log("aa a*: " + isMatch("aa", "a*"));
console.log("ab .*: " + isMatch("ab", ".*"));
console.log("ab a.*: " + isMatch("ab", "a.*"));
