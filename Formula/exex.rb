class Exex < Formula
  desc "Terminal UI for exploring ELF, Mach-O and PE binaries"
  homepage "https://github.com/rabarbra/exex"
  version "0.1.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rabarbra/exex/releases/download/v#{version}/exex-v#{version}-darwin-arm64.tar.gz"
      sha256 "dbc47c164e1e9cdd39a9bc02260930a89896e447b994322efe74e9c2467ee4a3"
    end
    on_intel do
      url "https://github.com/rabarbra/exex/releases/download/v#{version}/exex-v#{version}-darwin-amd64.tar.gz"
      sha256 "64fa67eabb78412b132038527ff8b39c1fcb7605158882af4d286f3692baf39f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rabarbra/exex/releases/download/v#{version}/exex-v#{version}-linux-arm64.tar.gz"
      sha256 "a4291be19e9f3b5dcdb804ccf3f53c59f48ef7a78ff9659387dd58c1031365a7"
    end
    on_intel do
      url "https://github.com/rabarbra/exex/releases/download/v#{version}/exex-v#{version}-linux-amd64.tar.gz"
      sha256 "c19eb61cb1df53e8ace14daab74e376d1c3ef1760a741d993681aabe715cdcb5"
    end
  end

  def install
    bin.install "exex"
    pkgshare.install "config.example.yaml" if File.exist?("config.example.yaml")
    doc.install "README.md" if File.exist?("README.md")

    man1.install "exex.1" if File.exist?("exex.1")

    bash_completion.install "completions/exex.bash" => "exex" if File.exist?("completions/exex.bash")
    zsh_completion.install "completions/_exex" if File.exist?("completions/_exex")
    fish_completion.install "completions/exex.fish" if File.exist?("completions/exex.fish")
  end

  test do
    # exex can introspect any binary; point it at itself and check the info view.
    assert_match(/Format:\s+\S+/, shell_output("#{bin}/exex -o info #{bin}/exex"))
  end
end
