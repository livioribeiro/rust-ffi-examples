ifeq ($(shell uname),Darwin)
    EXT := dylib
else
    EXT := so
endif

all: target/debug/libffi_example.$(EXT)
	ruby src/main.rb

target/debug/libffi_example.$(EXT): src/lib.rs Cargo.toml
	cargo build

clean:
	rm -rf target
