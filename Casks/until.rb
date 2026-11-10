cask "until" do
  os macos: "darwin-arm64.dmg", linux: "linux-amd64.tar.gz"

  version "0.13.0"
  sha256 arm:          "8759ad83324594740590034e18db3518d10b265d68c5fc92bedb12656c19bdf3",
         x86_64_linux: "5ac92d82d85f1799dba60245b5620678395a797f4fae88c9bfd29f5f011a1071"

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
    Until sends one anonymous ping a day: a hash of you, a hash of your
    Workspace, and the Until version. It never sends names, emails,
    repository names or Ticket content.
    See exactly what it sends with `untl telemetry`. Turn it off with
    `untl telemetry off`, or set UNTIL_TELEMETRY=0 or DO_NOT_TRACK=1.

    To get started from the command line, run:

        $ untl
  EOS
end
