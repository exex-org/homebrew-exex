# homebrew-exex

Homebrew tap for [exex](https://github.com/rabarbra/exex) — a terminal UI for
exploring ELF, Mach-O and PE binaries (header, sections, symbols, disassembly,
hex, strings, libraries and DWARF-driven source mapping).

## Install

```sh
brew install exex-org/exex/exex
```

Or tap first, then install:

```sh
brew tap exex-org/exex
brew install exex
```

## Upgrade

```sh
brew upgrade exex
```

## Supported platforms

| OS    | Architectures   |
|-------|-----------------|
| macOS | arm64, x86_64   |
| Linux | arm64, x86_64   |

The formula installs the **full** build (Chroma-based syntax highlighting). The
example config is installed under `$(brew --prefix)/share/exex/` and the
`README.md` under the formula's `doc` directory.

## Usage

```
exex [-debug PATH] [-s STRING] [-o [VIEW]] <binary> [goto]
```

See the upstream [README](https://github.com/rabarbra/exex) for full
documentation, key bindings and the colour/theme schema.
