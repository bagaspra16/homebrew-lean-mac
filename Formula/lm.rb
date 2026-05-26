class Lm < Formula
  desc "Developer-aware storage analysis & cleanup for macOS (terminal-first)"
  homepage "https://github.com/bagaspra16/lean-mac"
  url "https://github.com/bagaspra16/lean-mac/archive/refs/tags/v0.5.3.tar.gz"
  sha256 "72ca6cca2e77bac213b3e8cad6cd886f8401d0246006faf70916819cd794aa70"
  license "MIT"
  head "https://github.com/bagaspra16/lean-mac.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
    ]
    system "go", "build",
           "-trimpath",
           "-ldflags", ldflags.join(" "),
           "-o", bin/"lm",
           "./cmd/lm"
  end

  test do
    assert_match "lean-mac", shell_output("#{bin}/lm --help")
    # `doctor` works without arguments and never touches the filesystem.
    system bin/"lm", "doctor"
  end
end
