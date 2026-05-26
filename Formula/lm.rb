class Lm < Formula
  desc "Developer-aware storage analysis & cleanup for macOS (terminal-first)"
  homepage "https://github.com/bagaspra16/lean-mac"
  url "https://github.com/bagaspra16/lean-mac/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "1816934afc1864c485ee5a7e87f1fb4e499c40a72b17cb433f727a9b9d151fb7"
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
