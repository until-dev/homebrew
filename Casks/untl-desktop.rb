cask "untl-desktop" do
  version "0.5.0"
  sha256 "4106a8f0424e71cd96dc230413117131891ef3084594591b299d0cbd9fcdea74"

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

  caveats <<~EOS
    Run `untl` to get started from the command line.
  EOS
end
