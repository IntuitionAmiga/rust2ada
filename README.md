# PrEP

**P**rogrammatic **r**ust **E**xtraction and **P**rotection - A tool to convert Rust code to Ada/SPARK, making your systems immune to the Rust virus.

### (c) 2025 Zayn Otley
### GPLv3 License or later
### https://github.com/intuitionamiga/rust2ada


## Overview

PrEP is a lightweight, efficient source-to-source compiler that transforms Rust code into idiomatic Ada/SPARK. This tool allows organisations to leverage the safety and reliability of the Ada/SPARK ecosystem whilst utilising existing Rust codebases.

## Motivation

Rust has gained significant popularity for its memory safety guarantees without garbage collection. However, in critical systems where formal verification is required, Ada/SPARK offers stronger safety guarantees through its contract-based programming model and support for formal verification.

PrEP creates a bridge between these two worlds, allowing developers to:

- Migrate Rust projects to Ada/SPARK
- Leverage existing Rust libraries in Ada/SPARK projects
- Benefit from Ada/SPARK's formal verification capabilities

## Installation

```bash
git clone https://github.com/intuitionamiga/rust2ada
cd rust2ada
make            # Build release version
```

Additional make targets:
- `make debug`    - Build debug version
- `make install`  - Install to /usr/local/bin
- `make test-self` - Test self-conversion capability
- `make clean`    - Remove built files
- `make help`     - Display help message

The executable will be available at `./rust2ada`.

## Usage

For single file conversion:

```bash
rust2ada input.rs output.adb
```

For directory conversion (processes all .rs files recursively):

```bash
rust2ada src/ ada_output/
```

PrEP will generate both spec (.ads) and body (.adb) files for each Rust source file.

## Self-Convertibility

PrEP is designed to be self-convertible, meaning it can translate its own source code into Ada/SPARK. This serves as both a practical test and a demonstration of its capabilities.

To convert PrEP itself:

```bash
make
./rust2ada main.rs rust2ada.adb
```

## Features

- Converts Rust function declarations to Ada procedure/function specifications
- Generates both Ada package specifications (.ads) and bodies (.adb)
- Recursive directory traversal for batch conversion
- Transforms Rust types to their Ada equivalents:
  - Primitive types (i32, u64, f32, bool, etc.)
  - Collections (Vec, HashMap) to Ada.Containers equivalents
  - Result<T, E> to Ada discriminated records
  - String operations with Ada.Strings.Unbounded
- Converts file operations via Ada.Directories and Ada.Text_IO
- Handles Rust control structures (if, for, while)
- Self-convertibility: PrEP can translate its own source code

## Limitations

PrEP is intentionally minimalist and focuses on core language conversion rather than being a comprehensive translator. Current limitations include:

- Limited support for complex Rust features (traits, advanced generics)
- No handling of Rust's borrow checker semantics
- Simplified conversion of complex expressions
- Limited pattern matching conversion
- No auto-generation of SPARK proof annotations

## Roadmap

- [ ] Support for Rust traits as Ada interfaces
- [ ] Handling of Rust's ownership model via SPARK ownership annotations
- [ ] Integration with GNAT toolchain for seamless compilation
- [ ] Enhanced type mapping for complex generic types
- [ ] Automated SPARK proof annotations generation
- [ ] Source-to-source bidirectional conversion for true language interoperability

## Contributing

Contributions are welcome. Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the GPL v3 License or later - see the LICENSE file for details.

---

*Note: PrEP is a tool for code conversion and does not provide actual immunity against viruses or infections. The name is a playful reference to Pre-Exposure Prophylaxis medications.*
