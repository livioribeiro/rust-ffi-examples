#include <stdint.h>
#include <stdio.h>
#include <string.h>

extern int32_t double_input(int32_t input);
extern int32_t string_len(char* input);

int main() {
    int input = 4;
    int output = double_input(input);
    printf("[double_input(int) -> int]\n");
    printf("%d * 2 = %d\n", input, output);
    printf("\n");

    char* inputStr = "Hello, FFI!";
    output = string_len(inputStr);
    printf("[string_len(string) -> int]");
    printf("Input: \"%s\"\nC len: %zd\nRust len: %d\n", inputStr, strlen(inputStr), output);

    return 0;
}
