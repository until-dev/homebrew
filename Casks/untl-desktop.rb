cask "untl-desktop" do
  version "0.7.0"
  sha256 "048c0c3f632066380a96099e3473795ebd6d0cc46ccc29d481dac37a41c113cc"

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
