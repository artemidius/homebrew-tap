# Homebrew tap

Homebrew formulae for [Le Harness](https://github.com/artemidius/Le-Harness).

Le Harness is currently a release candidate. The tap supports Apple Silicon
macOS plus x86_64 and ARM64 Linux using the upstream prebuilt release
artifacts; installation does not require a Rust toolchain.

```sh
brew install artemidius/tap/le-harness
le-harness --no-input doctor
```

Upgrade or uninstall with:

```sh
brew update
brew upgrade artemidius/tap/le-harness
brew uninstall le-harness
```

Intel macOS is not supported by the current upstream release matrix.
