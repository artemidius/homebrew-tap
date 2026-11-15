class LeHarness < Formula
  desc "Transparent coding-agent runtime for the Mistral ecosystem"
  homepage "https://github.com/artemidius/Le-Harness"
  license "MIT"

  depends_on "ca-certificates"
  depends_on "git"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/artemidius/Le-Harness/releases/download/v0.1.0-rc.11/le-harness-v0.1.0-rc.11-aarch64-apple-darwin.tar.gz"
      sha256 "48ce4a6b954a746a1781aad582b73e8d59616676b8fcfefa7171e58f0b06cff3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/artemidius/Le-Harness/releases/download/v0.1.0-rc.11/le-harness-v0.1.0-rc.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c41864009ad41337acdedd83e56422fb678f3104c21e70d6a6fbbfe7c72910ad"
    end

    on_intel do
      url "https://github.com/artemidius/Le-Harness/releases/download/v0.1.0-rc.11/le-harness-v0.1.0-rc.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3b2ae2d928b16848a143e6736a9b8c42d9439a0b8510e80265351c08805de54e"
    end
  end

  def install
    bin.install "le-harness"
  end

  test do
    assert_equal "le-harness #{version}", shell_output("#{bin}/le-harness --version").strip
    output = shell_output("#{bin}/le-harness --no-input doctor")
    assert_match "MISTRAL_API_KEY environment override: missing", output
    assert_match "Docker isolation:", output
  end
end
