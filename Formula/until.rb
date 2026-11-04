class Until < Formula
  desc "Git-backed ticketing for people and agents"
  homepage "https://github.com/overmindtech/until"
  version "0.3.0"
  license "LicenseRef-Until-Early-Access"

  on_macos do
    on_arm do
      url "https://github.com/until-dev/homebrew-tap/releases/download/v#{version}/untl-darwin-arm64"
      sha256 "e35f38c581e689908ee99e32ebfa31cde13853ea943a3e46e1233f912ffbbeed"

      resource "desktop" do
        url "https://github.com/until-dev/homebrew-tap/releases/download/v0.3.0/untl-desktop-darwin-arm64.dmg"
        sha256 "f4df9d43b970195751b7b0f820e69d419a612b7893df2de0c98c260d93a6caf5"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/until-dev/homebrew-tap/releases/download/v#{version}/untl-linux-amd64"
      sha256 "59e4deccfcbbedeadb11c2b215ca1a9e2d8ca7062594f1db340b8a8b64586c7d"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "untl-darwin-arm64" => "untl"

      resource("desktop").stage do
        dmg = Pathname("untl-desktop-darwin-arm64.dmg")
        mount_point = Pathname("dmgmount")
        mount_point.mkpath
        quiet_system "hdiutil", "attach", "-readonly", "-nobrowse",
                       "-mountpoint", mount_point, dmg
        begin
          app = mount_point/"untl-desktop.app"
          odie "expected untl-desktop.app at DMG root" unless app.exist?

          prefix.install app
        ensure
          quiet_system "hdiutil", "detach", mount_point, "-quiet"
        end
      end

      applications = Pathname("#{HOMEBREW_PREFIX}/Applications")
      applications.mkpath
      (applications/"untl-desktop.app").unlink if (applications/"untl-desktop.app").exist?
      (applications/"untl-desktop.app").make_symlink prefix/"untl-desktop.app"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "untl-linux-amd64" => "untl"
    else
      odie "until supports macOS Apple Silicon and Linux x86_64 only"
    end
  end

  def caveats
    on_macos do
      <<~EOS
        untl-desktop is linked at:
          #{HOMEBREW_PREFIX}/Applications/untl-desktop.app
      EOS
    end
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/untl version")
    if OS.mac? && Hardware::CPU.arm?
      assert_predicate Pathname("#{HOMEBREW_PREFIX}/Applications/untl-desktop.app"), :exist?
    end
  end
end
