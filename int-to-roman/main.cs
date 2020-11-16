public class Solution {
    public Dictionary<int, string> romanNumerials {
        get => new Dictionary<int, string>() {
            {1, "I"},
            {5, "V"},
            {10, "X"},
            {50, "L"},
            {100, "C"},
            {500, "D"},
            {1000, "M"},
            {4, "IV"},
            {9, "IX"},
            {40, "XL"},
            {90, "XC"},
            {400, "CD"},
            {900,"CM"}
        };
    }
    
    public string IntToRoman(int num) {        
        var result = "";
        
        foreach(var(iVal, sVal) in romanNumerials.OrderByDescending(e => e.Key)) {
            while (num - iVal >= 0) {
                num -= iVal;
                result += sVal;
            }
        }
        
        return result;
    }
}

