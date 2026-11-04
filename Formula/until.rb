class Until < Formula
  desc "Git-backed ticketing for people and agents"
  homepage "https://github.com/overmindtech/until"
  version "0.3.0"
  license "LicenseRef-Until-Early-Access"

  on_macos do
    on_arm do
      url "https://github.com/until-dev/homebrew-tap/releases/download/v#{version}/untl-darwin-arm64"
      sha256 "e35f38c581e689908ee99e32ebfa31cde13853ea943a3e46e1233f912ffbbeed"
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
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "untl-linux-amd64" => "untl"
    else
      odie "until supports macOS Apple Silicon and Linux x86_64 only"
    end
  end

  def caveats
    on_macos do
      <<~EOS
        The untl-desktop app is a separate cask:
          brew install --cask until-dev/tap/untl-desktop
      EOS
    end
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/untl version")
  end
end
