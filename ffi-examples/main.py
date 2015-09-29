from __future__ import print_function

from ctypes import cdll, c_int32, c_char_p
from sys import platform, version_info

if platform == "darwin":
    ext = "dylib"
else:
    ext = "so"

lib = cdll.LoadLibrary('target/debug/libffi_example.' + ext)

double_input = lib.double_input
double_input.restype = c_int32
double_input.argtypes = (c_int32,)

string_len = lib.string_len
string_len.restype = c_int32
string_len.argtypes = (c_char_p,)

input_int = 4
output = double_input(input_int)
print('[double_input(int) -> int]')
print('{} * 2 = {}'.format(input_int, output))
print()

print('[string_len(string) -> int]')
input_str = 'Hello, FFI!'
output = string_len(input_str.encode())
print('Input: "{}"\nPython len: {}\nRust len: {}'.format(input_str, len(input_str), output))
