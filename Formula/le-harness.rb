class LeHarness < Formula
  desc "Transparent coding-agent runtime for the Mistral ecosystem"
  homepage "https://github.com/artemidius/Le-Harness"
  license "MIT"

  depends_on "ca-certificates"
  depends_on "git"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/artemidius/Le-Harness/releases/download/v0.1.0-rc.5/le-harness-v0.1.0-rc.5-aarch64-apple-darwin.tar.gz"
      sha256 "c5b7551063ee1425a5b297cee635e4cad14688dde37a194faf02c616db3e8ccf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/artemidius/Le-Harness/releases/download/v0.1.0-rc.5/le-harness-v0.1.0-rc.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f3f60c2b0f7e42ffab5d9182b2ce3c1c72ba8ba2d3115d8758d4cb4b972cea35"
    end

    on_intel do
      url "https://github.com/artemidius/Le-Harness/releases/download/v0.1.0-rc.5/le-harness-v0.1.0-rc.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1deb28b11ee810f82f446bd563e6d92548af26ea245f7416606908b3319c175d"
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
