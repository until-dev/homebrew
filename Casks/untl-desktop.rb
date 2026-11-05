cask "untl-desktop" do
  os macos: "darwin-arm64.dmg", linux: "linux-amd64.tar.gz"

  version "0.9.0"
  sha256 arm:          "d0f4996d2d0b094ef594e041753f4ee2ca7b5c33dc0bf228e919f43a6bbff681",
         x86_64_linux: "07534e772f992b7618f545cbc0687ca236900588716c9c660ffe81ef5411f6dd"

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
