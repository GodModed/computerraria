#!/usr/bin/sh

# Helper script to copy file to txt file format WireHead expects
# Example: ./copy_bin.sh /tmp/in.txt

# Rebuild project
cargo build --release

# Convert from elf to bin
# Fancy glob matching! https://zsh.sourceforge.io/Doc/Release/Expansion.html#Glob-Qualifiers
# rust-objcopy -O binary ./target/riscv32i-unknown-none-elf/release/*(x.) /tmp/rust.bin 
rust-objcopy -O binary ./target/riscv32i-unknown-none-elf/release/video /tmp/rust.bin 

# Convert from bin to txt
hexdump -ve '1/1 "%.2x "' /tmp/rust.bin | head -c -1 > $1

