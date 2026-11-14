class LeHarness < Formula
  desc "Transparent coding-agent runtime for the Mistral ecosystem"
  homepage "https://github.com/artemidius/Le-Harness"
  license "MIT"

  depends_on "ca-certificates"
  depends_on "git"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/artemidius/Le-Harness/releases/download/v0.1.0-rc.6/le-harness-v0.1.0-rc.6-aarch64-apple-darwin.tar.gz"
      sha256 "825df105b30d1d7ea54c1c9f72ae6ed391500f3f327710d23df024fe9dbb4580"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/artemidius/Le-Harness/releases/download/v0.1.0-rc.6/le-harness-v0.1.0-rc.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "528e4ed00f16c98e30c09182183abb804b98d7cfe28149055d015272da6526de"
    end

    on_intel do
      url "https://github.com/artemidius/Le-Harness/releases/download/v0.1.0-rc.6/le-harness-v0.1.0-rc.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "27d033dd84f869babd27e2164e48a9b54fa53c9703385539d5b5437d101dc5a3"
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
