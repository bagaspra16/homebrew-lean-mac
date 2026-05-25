# homebrew-lean-mac

Homebrew tap for [lean-mac](https://github.com/bagaspra16/lean-mac) — developer-aware storage analysis & cleanup for macOS.

## Install

```sh
brew tap bagaspra16/lean-mac
brew install lm
```

Or in one shot:

```sh
brew install bagaspra16/lean-mac/lm
```

## Use

```sh
lm           # interactive TUI
lm scan      # text summary
lm clean     # interactive cleanup (confirm per category)
lm doctor    # environment check
```

See the [main repo](https://github.com/bagaspra16/lean-mac) for full docs.

## Updating

When a new lean-mac tag ships, this tap is updated with a new `url` + `sha256` in `Formula/lm.rb`. Run `brew update && brew upgrade lm`.
