class JpkiCli < Formula
  desc "Read certificates, sign and verify documents using your JPKI card"
  homepage "https://github.com/siketyan/jpki-rs"
  url "https://github.com/siketyan/jpki-rs/archive/refs/tags/0.4.3.tar.gz"
  sha256 "c7954b0b0f0713a3706ac76e506128fb512c0dab488b71daba33d64d1e379b8f"
  license "LGPL-2.1"

  depends_on "rust" => :build

  on_linux do
    depends_on "pcsc-lite"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/jpki-cli", "-V"
  end
end
