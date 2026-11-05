cask "untl-desktop" do
  os macos: "darwin-arm64.dmg", linux: "linux-amd64.tar.gz"

  version "0.10.1"
  sha256 arm:          "13fbf2032f65067dde79dee073c24875affa8eb42ee19257fc1e5a8af72a7d29",
         x86_64_linux: "3a20162d8a0c50741d730a40b4cd6096d6df8743867e6334b3b047125e5c5baf"

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
