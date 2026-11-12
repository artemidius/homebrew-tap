class LeHarness < Formula
  desc "Transparent coding-agent runtime for the Mistral ecosystem"
  homepage "https://github.com/artemidius/Le-Harness"
  license "MIT"

  depends_on "ca-certificates"
  depends_on "git"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/artemidius/Le-Harness/releases/download/v0.1.0-rc.9/le-harness-v0.1.0-rc.9-aarch64-apple-darwin.tar.gz"
      sha256 "ec9f3a80f4f257615db8cb3127e1ad59b88c96f2d4b33829ca07902c0abfd1c3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/artemidius/Le-Harness/releases/download/v0.1.0-rc.9/le-harness-v0.1.0-rc.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "382e97b3f82f582a6636810419736eadf80d26214162612c00f370b778977d74"
    end

    on_intel do
      url "https://github.com/artemidius/Le-Harness/releases/download/v0.1.0-rc.9/le-harness-v0.1.0-rc.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4f1a56fd51c3e058b862d8fcc6b86c1fa92f8b03244d31b0792fb20afccae0b9"
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
