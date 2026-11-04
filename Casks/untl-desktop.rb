cask "untl-desktop" do
  version "0.4.0"
  sha256 "407278b3c678a1f85180084339412217707496c29954f0adfd843f2c990d2dd0"

  url "https://github.com/until-dev/homebrew-tap/releases/download/v#{version}/untl-desktop-darwin-arm64.dmg"
  name "untl-desktop"
  desc "Git-backed ticketing for people and agents"
  homepage "https://github.com/overmindtech/until"

  depends_on arch: :arm64
  depends_on :macos

  app "untl-desktop.app"
  binary "#{appdir}/untl-desktop.app/Contents/Resources/bin/untl"

  # The app is signed, notarized and checksum-verified, so skip the
  # "downloaded from the internet" prompt on first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/untl-desktop.app"]
  end
end
