var ffi = require('ffi');

var lib = ffi.Library('target/debug/libffi_example', {
  'double_input': [ 'int', [ 'int' ] ],
  'string_len': [ 'int', [ 'string' ] ]
});

var input = 4;
var output = lib.double_input(input);
console.log('[double_input(int) -> int]');
console.log(input + " * 2 = " + output);
console.log();

input = 'Hello, FFI!';
output = lib.string_len(input);
console.log('[string_len(string) -> int]');
console.log('Input: "' + input + '"'
  + '\nNode len: ' + input.length
  + '\nRust len: ' + output);
