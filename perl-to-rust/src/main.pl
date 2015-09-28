use v5.10;
use FFI::Raw;

my $double_input = FFI::Raw->new(
    "target/debug/libffi_example.so",
    'double_input',
    FFI::Raw::int,    # return value
    FFI::Raw::int     # arg #1
);

my $string_len = FFI::Raw->new(
    "target/debug/libffi_example.so",
    'string_len',
    FFI::Raw::int,    # return value
    FFI::Raw::str     # arg #1
);

my $input  = 4;
my $output = $double_input->call($input);
say "[double_input(int) -> int]";
say $input . " * 2 = " . $output;
say "";

my $input  = "Hello, FFI!";
my $output = $string_len->call($input);
say "[string_len(string) -> int]";
say "Input: \"" . $input . "\"\nPerl len: " . (length $input) . "\nRust len: " . $output;
