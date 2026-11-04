cask "untl-desktop" do
  version "0.3.0"
  sha256 "f4df9d43b970195751b7b0f820e69d419a612b7893df2de0c98c260d93a6caf5"

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
