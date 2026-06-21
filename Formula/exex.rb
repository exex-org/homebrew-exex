class Exex < Formula
  desc "Terminal UI for exploring ELF, Mach-O and PE binaries"
  homepage "https://github.com/rabarbra/exex"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rabarbra/exex/releases/download/v#{version}/exex-v#{version}-darwin-arm64.tar.gz"
      sha256 "d342dbe514edfa8d2a67a291f20444f713965b2b65559a33418f884f8491597c"
    end
    on_intel do
      url "https://github.com/rabarbra/exex/releases/download/v#{version}/exex-v#{version}-darwin-amd64.tar.gz"
      sha256 "d8c8b1343251d07dd484c900d2ccfa7c07e9dd0ec21b176d3030083e52b5fbf0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rabarbra/exex/releases/download/v#{version}/exex-v#{version}-linux-arm64.tar.gz"
      sha256 "26fdab1087e2d96ed8de6ce883e911015fd776e5b00c4f565e4dd78237a93331"
    end
    on_intel do
      url "https://github.com/rabarbra/exex/releases/download/v#{version}/exex-v#{version}-linux-amd64.tar.gz"
      sha256 "9208dc4f0da1d01bd6eadd928dcfd182ad35015d01451fb312c8d785a52bb7b5"
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
