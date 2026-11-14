class LeHarness < Formula
  desc "Transparent coding-agent runtime for the Mistral ecosystem"
  homepage "https://github.com/artemidius/Le-Harness"
  license "MIT"

  depends_on "ca-certificates"
  depends_on "git"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/artemidius/Le-Harness/releases/download/v0.1.0-rc.7/le-harness-v0.1.0-rc.7-aarch64-apple-darwin.tar.gz"
      sha256 "32669d6ddc1bbac68b76207702de2412b2ff9825fa90d039c4f95146394a57b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/artemidius/Le-Harness/releases/download/v0.1.0-rc.7/le-harness-v0.1.0-rc.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "305960cdb96ed25e705186c7a081619293e894514011b03d44b24b89fba7ea35"
    end

    on_intel do
      url "https://github.com/artemidius/Le-Harness/releases/download/v0.1.0-rc.7/le-harness-v0.1.0-rc.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "034308489038bd40127f043b37ef811252078928349a908df6c7e1a677d149c2"
    end
  end

  def install
    bin.install "le-harness"
  end

  test do
    assert_equal "le-harness #{version}", shell_output("#{bin}/le-harness --version").strip
    output = shell_output("#{bin}/le-harness --no-input doctor")
    assert_match "MISTRAL_API_KEY: missing", output
    assert_match "Docker isolation:", output
  end
end
