# until-dev/homebrew-tap

Public Homebrew tap for [Until](https://until.dev): one cask, `until`, that installs the `untl-desktop` app and the `untl` CLI for macOS Apple Silicon and Linux x86_64 at the same version.

## Install

On macOS Apple Silicon or Linux x86_64, trust the cask, then install it. Homebrew loads casks from taps other than its own only once you trust them:

```bash
brew trust --cask until-dev/tap/until
brew install --cask until-dev/tap/until
```

On macOS this installs `untl-desktop.app` in `/Applications` and links the `untl` CLI bundled inside the app onto your PATH. On Linux it installs `untl-desktop.AppImage` in `~/Applications`, with a menu entry that opens `until://` links, and links the `untl` CLI from the same build onto your PATH. Either way the app and the CLI are always the same version.

On Linux you can instead install the `until` package (CLI and desktop app) from the public Cloudsmith repository [`overmind/until`](https://cloudsmith.io/~overmind/repos/until/). For a CLI-only install, download `untl-linux-amd64` from this tap's [releases](https://github.com/until-dev/homebrew-tap/releases) and verify it against `SHA256SUMS`.

The macOS DMG and the Linux tarball are copied byte-for-byte from the Until release, and their checksums are recorded in the cask.

## Distribution terms

Download URLs in this tap's [releases](https://github.com/until-dev/homebrew-tap/releases) mirror the assets of each Until release. **Licence terms for redistributing the CLI and desktop app are pending legal sign-off** (see PLAN-217). Until those terms are published here, treat these binaries as early-access builds for invited testers only.

## Maintainers

A workflow in the private Until source repository mirrors release assets to this tap automatically when a version is tagged. Cask bumps land as pull requests on this tap; merge when `brew test-bot` is green (no `pr-pull` — we ship prebuilt binaries, not bottles).

Bootstrap this repository from the Until source checkout:

```bash
gh repo create until-dev/homebrew-tap --public --description "Homebrew tap for until" --source=packaging/homebrew-tap --remote=origin --push
```

Requires org permission to create `until-dev/homebrew-tap` and a CI token with release upload plus contents and pull-request access on this repo (see PLAN-217).
