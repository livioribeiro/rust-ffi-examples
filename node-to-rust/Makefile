ifeq ($(shell uname),Darwin)
    EXT := dylib
else
    EXT := so
endif

all: target/debug/libffi_example.$(EXT) node_modules/ffi
	node src/main.js

target/debug/libffi_example.$(EXT): src/lib.rs Cargo.toml
	cargo build

node_modules/ffi:
	npm install ffi

clean:
	rm -rf target
	rm -rf node_modules
