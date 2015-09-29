ifeq ($(shell uname),Darwin)
    LDFLAGS := -Wl,-dead_strip
		EXT := dylib
else
    LDFLAGS := -Wl,--gc-sections -lpthread
		EXT := so
endif

default:
	@echo "Run 'make <platform>' to run examples"

# Run C example
C: ffi-examples/target/c_example
	@echo "*** Running C example ***"
	@ffi-examples/target/c_example
	@echo

# Run Python example
python: target/debug/libffi_example.$(EXT)
	@echo "*** Running Python example ***"
	@python3 ffi-examples/main.py
	@echo

# Run Ruby example
ruby: target/debug/libffi_example.$(EXT)
	@echo "*** Running Ruby example ***"
	@ruby ffi-examples/main.rb
	@echo

# Run nodejs example
node: target/debug/libffi_example.$(EXT) node_modules/ffi
	@echo "*** Running nodejs example ***"
	@node ffi-examples/main.js
	@echo

# Run Perl example
perl: target/debug/libffi_example.$(EXT)
	@echo "*** Running Perl example ***"
	@perl ffi-examples/main.pl
	@echo

# Run Lua (luajit) example
lua: target/debug/libffi_example.$(EXT)
	@echo "*** Running Lua example ***"
	@luajit ffi-examples/main.lua
	@echo

all: C python ruby node perl lua


# Build of C example
ffi-examples/target/c_example: ffi-examples/target/main.o ffi-examples/target/libffi_example.a
	@$(CC) -o $@ $^ $(LDFLAGS)

ffi-examples/target/main.o: ffi-examples/main.c | ffi-examples/target
	@$(CC) -o $@ -c $<

ffi-examples/target:
	@mkdir -p $@

ffi-examples/target/libffi_example.a: target/debug/libffi_example.a
	@cp target/debug/libffi_example.a ffi-examples/target/

# Build rust lib
target/debug/libffi_example.a target/debug/libffi_example.so: src/lib.rs Cargo.toml
	cargo build

# Install nodejs ffi module
node_modules/ffi:
	npm install ffi

clean:
	rm -rf ffi-examples/target
	rm -rf node_modules
	cargo clean
