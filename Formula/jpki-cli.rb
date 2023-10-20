class JpkiCli < Formula
  desc "Read certificates, sign and verify documents using your JPKI card"
  homepage "https://github.com/siketyan/jpki-rs"
  url "https://github.com/siketyan/jpki-rs/archive/refs/tags/0.3.0.tar.gz"
  sha256 "e42576953c1a83589419b9ff40fde00e07fbd8723cad78d6108be1ffc695fcda"
  license "LGPL-2.1"

  depends_on "rust" => :build

  on_linux do
    depends_on "pcsc-lite"
  end

  def install
    system "cargo", "install", *std_cargo_args

    bash_completion.install "resources/shell/bash/ghr-completion.bash"
    fish_completion.install "resources/shell/fish/ghr-completion.fish"
  end

  test do
    system "#{bin}/jpki-cli", "-V"
  end
end
