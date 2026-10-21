class ParMux < Formula
  desc "tmux-control-mode-compatible terminal multiplexer daemon and client"
  homepage "https://github.com/paulrobello/par-term-emu-core-rust"
  version "0.63.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/paulrobello/par-term-emu-core-rust/releases/download/v0.63.0/par-mux-v0.63.0-x86_64-apple-darwin.tar.gz"
      sha256 "77ad64060048b1b66118430dc27a2887e50eb8ce477e2fcc70ae016f46b58607"
    end
    if Hardware::CPU.arm?
      url "https://github.com/paulrobello/par-term-emu-core-rust/releases/download/v0.63.0/par-mux-v0.63.0-aarch64-apple-darwin.tar.gz"
      sha256 "efa40efd691c246aa6bfa5524f477bec65dee04d717650611a98675345f85055"
    end
  end

  def install
    bin.install "par-mux"
  end

  def caveats
    <<~EOS
      Completions: run `par-mux completion <shell>` and follow its output.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/par-mux --version")
  end
end
