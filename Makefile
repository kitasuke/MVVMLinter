.PHONY: build build_release install clean

BIN_DIR = /usr/local/bin
RELEASE_BUILD_FLAGS= -c release --disable-sandbox

build:
	@swift build
build_release:
	@swift build $(RELEASE_BUILD_FLAGS)

install: build_release
	@install -d "$(BIN_DIR)"
	@install ".build/release/mvvmlint" "$(BIN_DIR)"
	@zip .build/release/mvvmlint .build/release/MVVMLint

clean:
	@rm -rf .build
