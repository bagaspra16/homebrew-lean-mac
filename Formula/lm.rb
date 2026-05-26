class Lm < Formula
  desc "Developer-aware storage analysis & cleanup for macOS (terminal-first)"
  homepage "https://github.com/bagaspra16/lean-mac"
  url "https://github.com/bagaspra16/lean-mac/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "6d6604d59b6e3dfef884a341e505b01d5911c62c56249ee02082382f06bc9994"
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
