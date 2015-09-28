ifeq ($(shell uname),Darwin)
    LDFLAGS := -Wl,-dead_strip
else
    LDFLAGS := -Wl,--gc-sections -lpthread
endif

all: target/ffi_example
	target/ffi_example

target:
	mkdir -p $@

target/ffi_example: target/main.o target/debug/libffi_example.a
	$(CC) -o $@ $^ $(LDFLAGS)

target/debug/libffi_example.a: src/lib.rs Cargo.toml
	cargo build

target/main.o: src/main.c | target
	$(CC) -o $@ -c $<

clean:
	rm -rf target
