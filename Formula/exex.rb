class Exex < Formula
  desc "Terminal UI for exploring ELF, Mach-O and PE binaries"
  homepage "https://github.com/rabarbra/exex"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rabarbra/exex/releases/download/v#{version}/exex-v#{version}-darwin-arm64.tar.gz"
      sha256 "fb119ab0eb6286abc007ea25e8ea323b99ab0c37a33b559d82eb14c3fd25a971"
    end
    on_intel do
      url "https://github.com/rabarbra/exex/releases/download/v#{version}/exex-v#{version}-darwin-amd64.tar.gz"
      sha256 "93f61c1111a0182888802157b615c3a62be1f91c5513f51946ed29f20fc98e10"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rabarbra/exex/releases/download/v#{version}/exex-v#{version}-linux-arm64.tar.gz"
      sha256 "7b92cf642fb8e9f69c9e91968e04f385467033a3f8a8647e3979e7cd1ddd7241"
    end
    on_intel do
      url "https://github.com/rabarbra/exex/releases/download/v#{version}/exex-v#{version}-linux-amd64.tar.gz"
      sha256 "6cf51b08cecfb2e3256dbdd24fe90fdc267d7c0f8dc1b0a89ab8092e780f3ecb"
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
