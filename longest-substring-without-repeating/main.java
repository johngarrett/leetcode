class Solution {
    public int lengthOfLongestSubstring(String s) {
        /*
            longest substring without repeating chars

            "abcabcbb"

            array substrings = [];

            for (int i = 0; i < s.size(); i++) {
                array characters = [];
                char = s[i];
                substring = "";

                int itr = 1;
                while(!character.contains(char)) {
                    characters.append(char);
                    char = s[itr + 1];
                    substring += char;
                    itr++;
                }
                substrings.append(substring);
            }

            return largest substring;

         */
        int maxLength = 0;

        for (int i = 0; i < s.length(); i++) {
            String substring = "";

            for (int j = i; j < s.length(); j++) {
                char nextChar = s.charAt(j);
                if (substring.indexOf(nextChar) == -1) {
                    substring += nextChar;
                } else {
                    break;
                }
            }

            if (substring.length() > maxLength) {
                maxLength = substring.length();   
            }
        }

        return maxLength;
    }
}
