class Exex < Formula
  desc "Terminal UI for exploring ELF, Mach-O and PE binaries"
  homepage "https://github.com/rabarbra/exex"
  version "0.1.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rabarbra/exex/releases/download/v#{version}/exex-v#{version}-darwin-arm64.tar.gz"
      sha256 "fa8c94870fabff86ac9ed709f2725fcd178fe1ec653c431286eb1f55a549da08"
    end
    on_intel do
      url "https://github.com/rabarbra/exex/releases/download/v#{version}/exex-v#{version}-darwin-amd64.tar.gz"
      sha256 "b8737a30dd831301dd598f5c1f105347a954a752fbfafedc20660be46eb01e61"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rabarbra/exex/releases/download/v#{version}/exex-v#{version}-linux-arm64.tar.gz"
      sha256 "e2560cb0cae9b8f935b8a4611f8340a32cd49248ecc4e327e5f499383d6f6386"
    end
    on_intel do
      url "https://github.com/rabarbra/exex/releases/download/v#{version}/exex-v#{version}-linux-amd64.tar.gz"
      sha256 "6e808ddb2fc3e11976045c9cd208c7b48b220f38f0a706664075003369f785b9"
    end
  end

  def install
    bin.install "exex"
    pkgshare.install "config.example.yaml" if File.exist?("config.example.yaml")
    doc.install "README.md" if File.exist?("README.md")
  end

  test do
    # exex can introspect any binary; point it at itself and check the info view.
    assert_match(/Format:\s+\S+/, shell_output("#{bin}/exex -o info #{bin}/exex"))
  end
end
