var romanToInt = function(s) {

    const romanNumerals = {
        'IV': 4,
        'IX': 9,
        'XL': 40,
        'XC': 90,
        'CD': 400,
        'CM': 900,
        'I': 1,
        'V': 5,
        'X': 10,
        'L': 50,
        'C': 100,
        'D': 500,
        'M': 1000
    }

    var numericalResult = 0

    for (rn in romanNumerals) {
        while (s.indexOf(rn) != -1) {
            numericalResult += romanNumerals[rn]
            s = s.replace(rn, '')
        }
    }

    return numericalResult
};

console.log(romanToInt("IVIVAIVX"))
