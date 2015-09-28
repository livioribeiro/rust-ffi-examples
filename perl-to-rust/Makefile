ifeq ($(shell uname),Darwin)
    EXT := dylib
else
    EXT := so
endif

all: target/debug/libffi_example.$(EXT)
	perl src/main.pl

target/debug/libffi_example.$(EXT): src/lib.rs Cargo.toml
	cargo build

clean:
	rm -rf target
