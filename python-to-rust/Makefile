ifeq ($(shell uname),Darwin)
    EXT := dylib
else
    EXT := so
endif

all: target/debug/libffi_example.$(EXT)
	python src/main.py

target/debug/libffi_example.$(EXT): src/lib.rs Cargo.toml
	cargo build

clean:
	rm -rf target
