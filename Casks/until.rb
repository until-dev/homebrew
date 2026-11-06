cask "until" do
  os macos: "darwin-arm64.dmg", linux: "linux-amd64.tar.gz"

  version "0.10.2"
  sha256 arm:          "3f3ffdb5242b3bc7f46706a1c963c5b721619565351d36da3f2e33c7c15934ea",
         x86_64_linux: "42fd8a5530400c63dc8c7ae30766b89eb76f0566875cd3aa53fbd6d0705d6f1f"

  on_macos do
    depends_on arch: :arm64

    app "untl-desktop.app"
    binary "#{appdir}/untl-desktop.app/Contents/Resources/bin/untl"

    # The app is signed, notarized and checksum-verified, so skip the
    # "downloaded from the internet" prompt on first launch. Clear the flag on
    # the staged copy before Homebrew moves it into the appdir: macOS refuses
    # changes to an app in /Applications without App Management, and a
    # refusal must never fail the install.
    preflight_steps do
      run "/usr/bin/xattr", args: ["-drs", "com.apple.quarantine", "{{staged_path}}/untl-desktop.app"],
          must_succeed: false, print_stderr: false
    end
  end
  on_linux do
    depends_on arch: :x86_64

    app_image "untl-desktop.AppImage"
    binary "untl"

    zap trash: "~/.config/untl-desktop"
  end

  url "https://github.com/until-dev/homebrew-tap/releases/download/v#{version}/untl-desktop-#{os}"
  name "Until"
  desc "Git-backed ticketing for people and agents"
  homepage "https://github.com/overmindtech/until"

  caveats <<~EOS
    Run `untl` to get started from the command line.
  EOS
end
