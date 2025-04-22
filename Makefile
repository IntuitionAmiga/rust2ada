# Makefile for PrEP (Programmatic rust Extraction and Protection)

# (c) 2025 Zayn Otley
# GPLv3 License or later
# https://github.com/intuitionamiga/rust2ada

# Compiler and flags
RUSTC = rustc
RUSTFLAGS_RELEASE = -O
RUSTFLAGS_DEBUG = -g

# Target executable
TARGET = rust2ada
TARGET_DEBUG = rust2ada-debug

# Source files
SRC = main.rs

# Version information
VERSION = 0.1.0

# Default target
all: release

# Check for Rust compiler
check-rustc:
	@which $(RUSTC) > /dev/null || (echo "Rust compiler not found. Please install Rust." && exit 1)

# Build rules
release: check-rustc $(TARGET)

debug: check-rustc $(TARGET_DEBUG)

$(TARGET): $(SRC)
	$(RUSTC) $(RUSTFLAGS_RELEASE) -o $(TARGET) $(SRC)

$(TARGET_DEBUG): $(SRC)
	$(RUSTC) $(RUSTFLAGS_DEBUG) -o $(TARGET_DEBUG) $(SRC)

# Run rule
run: $(TARGET)
	./$(TARGET)

# Test self-conversion
test-self: $(TARGET)
	./$(TARGET) $(SRC) main.adb
	@echo "Self-conversion test complete."

# Install rule
install: $(TARGET)
	mkdir -p $(DESTDIR)/usr/local/bin
	cp $(TARGET) $(DESTDIR)/usr/local/bin/

# Clean rule
clean:
	rm -f $(TARGET) $(TARGET_DEBUG) *.adb *.ads

# Version information
version:
	@echo "PrEP version $(VERSION)"

# Help rule
help:
	@echo "PrEP Makefile"
	@echo "Usage:"
	@echo "  make          - Build release version"
	@echo "  make release  - Build release version"
	@echo "  make debug    - Build debug version"
	@echo "  make run      - Run the program"
	@echo "  make test-self - Test self-conversion capability"
	@echo "  make install  - Install the program"
	@echo "  make clean    - Remove built files"
	@echo "  make version  - Display version information"
	@echo "  make help     - Display this help message"

# Phony targets
.PHONY: all release debug clean install version run help check-rustc test-self
