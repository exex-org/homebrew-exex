class Ttysvg < Formula
  desc "Record terminal sessions as SVG animations"
  homepage "https://github.com/rabarbra/ttysvg"
  version "0.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rabarbra/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_macos_arm64.tar.gz"
      sha256 "154b1d6337193f653c13df9cc973a080844c6f4238796dafdcc301b7983671ab"
    end

    on_intel do
      url "https://github.com/rabarbra/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_macos_x86_64.tar.gz"
      sha256 "d6852d1ebaf190d709ec9f803459fb3499c0ac0edee1256585699d4f9df6b1fc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rabarbra/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_linux_arm64.tar.gz"
      sha256 "b8d223058d5aab8a1e726ea9493930a87ed2cbfb1a3d65647f20e30acddcaeed"
    end

    on_intel do
      url "https://github.com/rabarbra/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_linux_x86_64.tar.gz"
      sha256 "c1de2825828d1941dd4174968877299eab91721d30cde5aba9d16ef9a5468723"
    end
  end

  def install
    bin.install "ttysvg"
    man1.install "man/man1/ttysvg.1"

    bash_completion.install "completions/ttysvg.bash" => "ttysvg"
    zsh_completion.install "completions/_ttysvg"
    fish_completion.install "completions/ttysvg.fish"
  end

  test do
    assert_match "ttysvg v#{version}", shell_output("#{bin}/ttysvg --version")
  end
end
