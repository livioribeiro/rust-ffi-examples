local ffi = require('ffi')

local ext

if ffi.os == 'Linux' then
    ext = 'so'
else
    ext = 'dylib'
end

ffi.cdef[[
int32_t double_input(int32_t input);
int32_t string_len(char* input);
]]

local lib = ffi.load('target/debug/libffi_example.' .. ext)
local double_input = lib.double_input
local string_len = lib.string_len

local input = 4
local output = double_input(input)
print('[double_input(int) -> int]')
print(input .. ' * 2 = ' .. output)
print()

input = 'Hello, FFI!'
output = string_len(ffi.new('char[?]', string.len(input), input))
print('[string_len(string) -> int]')
print(string.format('Input: %s\nLua len: %d\nRust len: %d', input, string.len(input), output))
