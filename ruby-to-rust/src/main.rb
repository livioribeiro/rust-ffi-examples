require 'ffi'

if RUBY_PLATFORM.include?('darwin')
  EXT = 'dylib'
else
  EXT = 'so'
end

module Lib
  extend FFI::Library
  ffi_lib 'target/debug/libffi_example.' + EXT
  attach_function :double_input, [ :int ], :int
  attach_function :string_len, [ :string ], :int
end

input = 4
output = Lib.double_input(input)
puts '[double_input(int) -> int]'
puts "#{input} * 2 = #{output}"
puts

puts '[string_len(string) -> int]'
input = 'Hello, FFI!'
output = Lib.string_len(input)
puts "Input: \"#{input}\"\nRuby len: #{input.length}\nRust len: #{output}"
