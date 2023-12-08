#!/usr/bin/env bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

$HOME/.cargo/bin/cargo install exa
$HOME/.cargo/bin/cargo install stylua
$HOME/.cargo/bin/cargo install tree-sitter-cli
