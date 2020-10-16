#include <stdio.h>
#include <ctype.h>
#include <math.h>
#include <limits.h>

int myAtio(char* s) {
    printf("input:\t%s\n", s);
    int positive = 1;

    // trim leading white space
    while(s[0] == ' ') {
        s += sizeof(char);
    }

    // remove sign if applicable
    if (s[0] == '-' || s[0] == '+') {
        positive = s[0] == '+';
        s++;
        s += sizeof(char);
    }

    // trim leading zeros
    while(s[0] == '0') {
        s += sizeof(char);
    }

    if (!isdigit(s[0])) {
        return 0;
    }

    int digit_length = 0;
    do {
        digit_length++;
    }while(isdigit(s[digit_length]));

    printf("DIGIT LENGTH: %d\n", digit_length);

    if (digit_length > 10) {
        return positive ? INT_MAX : INT_MIN;
    }

    int numerical_result = 0;

    for(int i = 0; i < digit_length; i++) {
        int val = s[i] - 48;
        //printf("inc: %f\n", (val * pow(10, digit_length - 1 - i)));
        // max: 2,147,483,648
        if (numerical_result * 10 + 8 >= INT_MAX) {
            return positive ? INT_MAX : INT_MIN;
        }
        numerical_result += val * pow(10, digit_length - 1 - i);
        //printf("value: %d\n", val);
    }

    printf("numerical_result: %d\n", positive ? numerical_result : -numerical_result);

    return positive ? numerical_result : -numerical_result;
}

int main() {
    myAtio("123");
    myAtio("       -42");
    myAtio("words and 987");
    myAtio("-91283472332");
}

