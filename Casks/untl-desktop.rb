cask "untl-desktop" do
  os macos: "darwin-arm64.dmg", linux: "linux-amd64.tar.gz"

  version "0.11.0"
  sha256 arm:          "f277cc2c1321e765549e93579a68463e4b2540290d6999f21c1568e6eda7edfa",
         x86_64_linux: "a1ee2da21bb6431744549d7ff675088b9e6f859de71156704fc6405c243855b9"

  on_macos do
    depends_on arch: :arm64

    app "untl-desktop.app"
    binary "#{appdir}/untl-desktop.app/Contents/Resources/bin/untl"

    # The app is signed, notarized and checksum-verified, so skip the
    # "downloaded from the internet" prompt on first launch.
    postflight_steps do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/untl-desktop.app"]
    end
  end
  on_linux do
    depends_on arch: :x86_64

    app_image "untl-desktop.AppImage"
    binary "untl"

    zap trash: "~/.config/untl-desktop"
  end

  url "https://github.com/until-dev/homebrew-tap/releases/download/v#{version}/untl-desktop-#{os}"
  name "untl-desktop"
  desc "Git-backed ticketing for people and agents"
  homepage "https://github.com/overmindtech/until"

  caveats <<~EOS
    Run `untl` to get started from the command line.
  EOS
end
