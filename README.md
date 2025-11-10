# ncurses-menu-app

Debian packaging repository for [ncurses-menu](https://github.com/minios-linux/ncurses-menu).

## Description

This repository provides Debian packaging for ncurses-menu, a simple terminal-based menu utility using ncurses library. This version is based on the MiniOS Linux fork which includes enhanced features such as multi-line title support, improved help output, and better layout handling.

## Building

To build the package locally:

```bash
make
```

This will:
1. Clone the upstream repository
2. Create the original tarball
3. Add debian packaging files
4. Build the .deb package

The resulting .deb file will be in the `build/` directory.

## Installation

```bash
sudo dpkg -i build/ncurses-menu_*.deb
```

## Cleaning

```bash
make clean
```

## Upstream

- Repository: https://github.com/minios-linux/ncurses-menu
- Original: https://github.com/Tomas-M/ncurses-menu
- License: GNU GPL v3
