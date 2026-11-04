# until-dev/homebrew-tap

Public Homebrew tap for [until](https://github.com/overmindtech/until): the `untl` CLI and, on macOS Apple Silicon, the `untl-desktop` app.

## Install

The `untl` CLI (macOS Apple Silicon and Linux x86_64):

```bash
brew install until-dev/tap/until
```

The `untl-desktop` app (macOS Apple Silicon). This also installs the CLI:

```bash
brew install --cask until-dev/tap/untl-desktop
```

CLI binaries are verified against the mirrored `SHA256SUMS` file from each release. The desktop DMG is copied byte-for-byte from the private release, and its checksum is recorded in the cask.

## Distribution terms

Public download URLs in this repository mirror release assets from the private until source tree. **Licence terms for redistributing the CLI and desktop app are pending legal sign-off**. Until those terms are published here, treat these binaries as early-access builds for invited testers only.

## Maintainers

Release assets are mirrored automatically from `overmindtech/until` tags by [`.github/workflows/publish-public-cli.yml`](https://github.com/overmindtech/until/blob/main/.github/workflows/publish-public-cli.yml) in the main until repository. Formula and cask bumps land together as pull requests on this tap; merge when `brew test-bot` is green (no `pr-pull` — we ship prebuilt binaries, not bottles).

Bootstrap this repository from the until checkout:

```bash
gh repo create until-dev/homebrew-tap --public --description "Homebrew tap for until" --source=packaging/homebrew-tap --remote=origin --push
```

Requires org permission to create `until-dev/homebrew-tap` and a CI token with release upload plus contents and pull-request access on this repo (see PLAN-217).
