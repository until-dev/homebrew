# until-dev/homebrew

Public Homebrew tap for [until](https://github.com/overmindtech/until): the `untl` CLI and, on macOS Apple Silicon, the `untl-desktop` app.

## Install

```bash
brew install until-dev/homebrew/until
```

- **macOS Apple Silicon:** installs `untl` on your PATH and `untl-desktop.app` under `$(brew --prefix)/Applications`.
- **Linux x86_64:** installs the CLI only.

CLI binaries are verified against the mirrored `SHA256SUMS` file from each release. The desktop DMG is copied byte-for-byte from the private release; its checksum is recorded in the formula.

## Distribution terms

Public download URLs in this repository mirror release assets from the private until source tree. **Licence terms for redistributing the CLI and desktop app are pending legal sign-off** (see PLAN-217). Until those terms are published here, treat these binaries as early-access builds for invited testers only.

## Unsigned macOS app

Homebrew does not sign or notarize `untl-desktop`. On first launch you may need to allow the app in System Settings or clear quarantine:

```bash
xattr -cr "$(brew --prefix)/Applications/untl-desktop.app"
```

## Maintainers

Release assets are mirrored automatically from `overmindtech/until` tags by [`.github/workflows/publish-public-cli.yml`](https://github.com/overmindtech/until/blob/main/.github/workflows/publish-public-cli.yml) in the main until repository. Formula bumps land as pull requests on this tap; merge when `brew test-bot` is green (no `pr-pull` — we ship prebuilt binaries, not bottles).

Bootstrap this repository from the until checkout:

```bash
gh repo create until-dev/homebrew --public --description "Homebrew tap for until" --source=packaging/homebrew-tap --remote=origin --push
```

Requires org permission to create `until-dev/homebrew` and a CI token with release upload plus contents and pull-request access on this repo (see PLAN-217).
