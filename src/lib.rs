extern crate libc;

use std::str;
use std::ffi::CStr;

use libc::c_char;

#[no_mangle]
pub extern fn double_input(input: i32) -> i32 {
    input * 2
}

#[no_mangle]
pub extern fn string_len(input: *const c_char) -> usize {
    let input_str = {
        let c_str = unsafe { CStr::from_ptr(input) };
        str::from_utf8(c_str.to_bytes()).unwrap()
    };

    input_str.len()
}
