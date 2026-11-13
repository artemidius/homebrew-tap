# Homebrew tap

Homebrew formulae for [Le Harness](https://github.com/artemidius/Le-Harness).

Le Harness is currently a release candidate. The tap supports Apple Silicon
macOS plus x86_64 and ARM64 Linux using the upstream prebuilt release
artifacts; installation does not require a Rust toolchain.

```sh
brew tap artemidius/tap
brew trust --formula artemidius/tap/le-harness
brew install artemidius/tap/le-harness
le-harness --no-input doctor
```

The formula-scoped trust command is required by current Homebrew releases for
third-party taps. It does not trust other current or future formulae from this
tap.

Upgrade or uninstall with:

```sh
brew update
brew upgrade artemidius/tap/le-harness
brew uninstall le-harness
```

Intel macOS is not supported by the current upstream release matrix.

Formula updates are generated from Le Harness's published release manifest.
The release workflow verifies the referenced archive bytes, pushes a dedicated
automation branch, and this repository runs the full three-platform formula
matrix before opening a focused pull request. Updates are still reviewed and
merged through the normal pull-request path.
