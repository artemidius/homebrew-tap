class LeHarness < Formula
  desc "Transparent coding-agent runtime for the Mistral ecosystem"
  homepage "https://github.com/artemidius/Le-Harness"
  license "MIT"

  depends_on "ca-certificates"
  depends_on "git"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/artemidius/Le-Harness/releases/download/v0.1.0-rc.10/le-harness-v0.1.0-rc.10-aarch64-apple-darwin.tar.gz"
      sha256 "fc2345da5318763d4e612f7a88da12e4e13fc97cf6d3909b5a73ce3cac3aaa17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/artemidius/Le-Harness/releases/download/v0.1.0-rc.10/le-harness-v0.1.0-rc.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "702edb7043189a37e2df49f22aed00238f843f04277541c7653eb2e237449286"
    end

    on_intel do
      url "https://github.com/artemidius/Le-Harness/releases/download/v0.1.0-rc.10/le-harness-v0.1.0-rc.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c7baa522a3fbc69c765fde10df2b6d67e2a73fc1b2059baa502c488cc834c88e"
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
