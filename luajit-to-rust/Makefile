ifeq ($(shell uname),Darwin)
    EXT := dylib
else
    EXT := so
endif

all: target/debug/libffi_example.$(EXT)
	luajit src/main.lua

target/debug/libffi_example.$(EXT): src/lib.rs Cargo.toml
	cargo build

clean:
	rm -rf target
