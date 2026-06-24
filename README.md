# homebrew-tap

Homebrew tap for:

| Formula | Description |
|---------|-------------|
| [exex](https://github.com/rabarbra/exex) | Terminal UI for exploring ELF, Mach-O and PE binaries |
| [ttysvg](https://github.com/rabarbra/ttysvg) | Record terminal sessions as SVG animations |

## Install

```sh
brew install exex-org/tap/exex
brew install exex-org/tap/ttysvg
```

Or tap first, then install:

```sh
brew tap exex-org/tap
brew install exex
brew install ttysvg
```

## Upgrade

```sh
brew upgrade exex
brew upgrade ttysvg
```

## Supported platforms

| OS    | Architectures   |
|-------|-----------------|
| macOS | arm64, x86_64   |
| Linux | arm64, x86_64   |

The `exex` formula installs the **full** build (Chroma-based syntax highlighting).
The example config is installed under `$(brew --prefix)/share/exex/` and the
`README.md` under the formula's `doc` directory.

## Usage

```
exex [-debug PATH] [-s STRING] [-o [VIEW]] <binary> [goto]
```

See the upstream [README](https://github.com/rabarbra/exex) for full
documentation, key bindings and the colour/theme schema.

```sh
ttysvg -o demo.svg
```

See the upstream [README](https://github.com/rabarbra/ttysvg) for full ttysvg
documentation.
