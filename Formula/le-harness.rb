class LeHarness < Formula
  desc "Transparent coding-agent runtime for the Mistral ecosystem"
  homepage "https://github.com/artemidius/Le-Harness"
  version "0.1.0-rc.4"
  license "MIT"

  depends_on "ca-certificates"
  depends_on "git"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/artemidius/Le-Harness/releases/download/v0.1.0-rc.4/le-harness-v0.1.0-rc.4-aarch64-apple-darwin.tar.gz"
      sha256 "6d6f6b062b25a52b7705bada0951d8200e8131d297072f6fb49da8418ab4c411"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/artemidius/Le-Harness/releases/download/v0.1.0-rc.4/le-harness-v0.1.0-rc.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "865e27018211914e59f89d7ffb608d80559f8e2a5cfa4ac3861e538b5b7b14d4"
    end

    on_intel do
      url "https://github.com/artemidius/Le-Harness/releases/download/v0.1.0-rc.4/le-harness-v0.1.0-rc.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e446354c4bce7c92365b7bf44d30e195a1af7234f1e02b3da2e9986b09a8b6a3"
    end
  end

  def install
    bin.install "le-harness"
  end

  test do
    assert_equal "le-harness #{version}", shell_output("#{bin}/le-harness --version").strip
    output = shell_output("#{bin}/le-harness --no-input doctor")
    assert_match "MISTRAL_API_KEY: missing", output
    assert_match "native execution is not a sandbox", output
  end
end
