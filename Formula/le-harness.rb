class LeHarness < Formula
  desc "Transparent coding-agent runtime for the Mistral ecosystem"
  homepage "https://github.com/artemidius/Le-Harness"
  license "MIT"

  depends_on "ca-certificates"
  depends_on "git"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/artemidius/Le-Harness/releases/download/v0.1.0-rc.8/le-harness-v0.1.0-rc.8-aarch64-apple-darwin.tar.gz"
      sha256 "c4f131d7fc3a5531cfab496e3216f3e50a416e5d12f3b131b19aa56765f2cd43"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/artemidius/Le-Harness/releases/download/v0.1.0-rc.8/le-harness-v0.1.0-rc.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5c665f89ad7e3f59d2d81872e4c12068d9353ad94ce1c7a4cf0e5c2aa731415c"
    end

    on_intel do
      url "https://github.com/artemidius/Le-Harness/releases/download/v0.1.0-rc.8/le-harness-v0.1.0-rc.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "258cfe6d51eb278c9ef5c4a81f8dfd02f72612c91c3f53a44c71d87d17df5c7c"
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
