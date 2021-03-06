#include <stdio.h>
#include <ctype.h>
#include <limits.h>

int myAtio(char* s) {
    int sign = 1;

    // trim leading white space
    while(s[0] == ' ')
    {
        s += sizeof(char);
    }

    // trim leading sign 
    if (s[0] == '-' || s[0] == '+')
    {
        sign = s[0] == '+' ? 1 : -1;
        s += sizeof(char);
    }

    // trim leading zeros
    while(s[0] == '0')
    {
        s += sizeof(char);
    }

    // ensure first char is digit
    if (!isdigit(s[0])) 
    {
        return 0;
    }


    unsigned int numerical_result = 0;
    for(unsigned short i = 0; isdigit(s[i]); ++i) 
    {
         if (numerical_result > INT_MAX / 10 || (numerical_result == INT_MAX / 10 && s[i] - '0' > 7)) 
         { 
             return sign == 1 ? INT_MAX: INT_MIN;
         } 
        numerical_result *= 10;
        numerical_result += s[i] - '0';
    }

    return sign * numerical_result;
}

int main() {
    myAtio("123");
    myAtio("       -42");
    myAtio("words and 987");
    printf("%d\n", myAtio("-91283472332"));
}

