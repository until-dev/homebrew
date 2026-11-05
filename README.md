# until-dev/homebrew-tap

Public Homebrew tap for [until](https://github.com/overmindtech/until): the `untl-desktop` app and the `untl` CLI for macOS Apple Silicon and Linux x86_64, shipped together as one cask.

## Install

On macOS Apple Silicon or Linux x86_64:

```bash
brew install --cask until-dev/tap/untl-desktop
```

On macOS this installs `untl-desktop.app` in `/Applications` and links the `untl` CLI bundled inside the app onto your PATH. On Linux it installs `untl-desktop.AppImage` in `~/Applications`, with a menu entry that opens `until://` links, and links the `untl` CLI from the same build onto your PATH. Either way the app and the CLI are always the same version.

On Linux you can instead install the `until` package (CLI and desktop app) from the public Cloudsmith repository [`overmind/until`](https://cloudsmith.io/~overmind/repos/until/). For a CLI-only install, download `untl-linux-amd64` from this repository's [releases](https://github.com/until-dev/homebrew-tap/releases) and verify it against `SHA256SUMS`.

The macOS DMG and the Linux tarball are copied byte-for-byte from the private release, and their checksums are recorded in the cask.

## Distribution terms

Public download URLs in this repository mirror release assets from the private until source tree. **Licence terms for redistributing the CLI and desktop app are pending legal sign-off**. Until those terms are published here, treat these binaries as early-access builds for invited testers only.

## Maintainers

Release assets are mirrored automatically from `overmindtech/until` tags by [`.github/workflows/publish-public-cli.yml`](https://github.com/overmindtech/until/blob/main/.github/workflows/publish-public-cli.yml) in the main until repository. Cask bumps land as pull requests on this tap; merge when `brew test-bot` is green (no `pr-pull` — we ship prebuilt binaries, not bottles).

Bootstrap this repository from the until checkout:

```bash
gh repo create until-dev/homebrew-tap --public --description "Homebrew tap for until" --source=packaging/homebrew-tap --remote=origin --push
```

Requires org permission to create `until-dev/homebrew-tap` and a CI token with release upload plus contents and pull-request access on this repo (see PLAN-217).
