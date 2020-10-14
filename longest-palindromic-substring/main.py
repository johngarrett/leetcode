class Solution:
    def longestPalindrome(self, s: str) -> str:
        def isPalendromic(s: str) -> bool:
            length = len(s)
            if length <= 1:
                return True
            elif length == 2:
                return s[:1] == s[1:]
            elif length % 2 == 0:
                return False
            # TODO: reverse second string
            else:
                middle = int((len(s)) / 2)
                return s[:middle] == s[middle + 1:]

        longestPal = ""
        for i in range(len(s)):
            pal = ""
            for j in range(i, len(s)):
                pal = pal + s[j]
                if isPalendromic(pal) and len(pal) > len(longestPal):
                    longestPal = pal
            return longestPal
