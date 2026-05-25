# homebrew-lean-mac

The Homebrew tap for [**lean-mac**](https://github.com/bagaspra16/lean-mac) — a developer-aware storage analysis & cleanup tool for macOS, used through a terminal binary called `lm`.

This repository contains exactly one thing: the Homebrew formula. Source code, documentation, issues, and contributions all live in the [main repo](https://github.com/bagaspra16/lean-mac).

---

## Install

```sh
brew install bagaspra16/lean-mac/lm
```

That single command does three things:

1. **taps** this repository (`bagaspra16/homebrew-lean-mac`) so Homebrew knows about the formula,
2. **downloads** the source tarball from the matching `lean-mac` release tag and verifies its SHA-256,
3. **builds** the binary with `go build` and links it to `/opt/homebrew/bin/lm` (Apple Silicon) or `/usr/local/bin/lm` (Intel).

After this, you can run `lm` from any directory.

If you prefer to tap first and install second:

```sh
brew tap bagaspra16/lean-mac
brew install lm
```

---

## What `lm` does, briefly

`lm` finds developer-specific storage waste on macOS — `node_modules`, Docker layers, Xcode caches, iOS simulators, package manager caches — and lets you reclaim space safely. It has an interactive TUI (just type `lm`) and a scriptable CLI (`lm scan`, `lm clean`, `lm doctor`, …).

There's also an **AI Cleanse** mode that walks you through cleanup conversationally — bring your own free Groq API key.

**Full features, screenshots, safety guarantees, AI setup, and usage are documented in the [main README](https://github.com/bagaspra16/lean-mac#readme).**

---

## Updating

```sh
brew update
brew upgrade lm
```

`brew update` refreshes this tap (Homebrew pulls the latest `Formula/lm.rb`). `brew upgrade lm` rebuilds if the formula's version is newer than what you have installed.

You can pin the current version if you don't want updates:

```sh
brew pin lm
```

Reverse with `brew unpin lm`.

---

## Uninstall

```sh
brew uninstall lm
brew untap bagaspra16/lean-mac    # optional, removes the tap itself
```

`lm` keeps no state outside the binary except `~/.config/lean-mac/config.toml` (only created if you set up AI Cleanse). Delete it manually if you want a clean slate.

---

## Requirements

- macOS, Apple Silicon recommended.
- Homebrew. If you don't have it: https://brew.sh.
- Optional but useful for the corresponding detectors: `docker`, `xcrun`, `brew`. Run `lm doctor` after install to see what's present.

The formula compiles `lm` from source on your machine using whatever Go version Homebrew currently ships (declared as a build-time dependency). You don't need Go installed beforehand — Homebrew handles it.

---

## Troubleshooting

**`brew install` fails with "Command Line Tools are too outdated"**

macOS needs current CLT to compile Go programs. Fix:

```sh
sudo rm -rf /Library/Developer/CommandLineTools
sudo xcode-select --install
```

Then retry `brew install bagaspra16/lean-mac/lm`.

**`brew install` says `lm` already exists at `/opt/homebrew/bin/lm`**

You probably installed an older copy manually with `make install`. Remove it first:

```sh
rm /opt/homebrew/bin/lm
brew install bagaspra16/lean-mac/lm
```

---

## How releases work

Every time a new `v*` tag is pushed to [`bagaspra16/lean-mac`](https://github.com/bagaspra16/lean-mac), the maintainer updates `Formula/lm.rb` in this repo with the new `url` and `sha256`. Brew users then receive it via `brew update && brew upgrade lm`. There is no autoupdate; you update when you want to.

---

## Issues, features, contributions

Open them in the **main repo**, not here: https://github.com/bagaspra16/lean-mac/issues.

For contributions, please email **bagaspratamajunianika72@gmail.com** first so we can align on the design — full details in the [main README](https://github.com/bagaspra16/lean-mac#contributing).

---

## License

`lean-mac` is MIT. This formula is too.
