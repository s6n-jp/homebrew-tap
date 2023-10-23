class JpkiCli < Formula
  desc "Read certificates, sign and verify documents using your JPKI card"
  homepage "https://github.com/siketyan/jpki-rs"
  url "https://github.com/siketyan/jpki-rs/archive/refs/tags/0.4.3.tar.gz"
  sha256 "c7954b0b0f0713a3706ac76e506128fb512c0dab488b71daba33d64d1e379b8f"
  license "LGPL-2.1"

  bottle do
    root_url "https://github.com/s6n-jp/homebrew-tap/releases/download/jpki-cli-0.4.3"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "76c96bba8a2697fd485f29c584394bbe3009fbcffcc8e4f2b0349b44c6a8aa1d"
    sha256 cellar: :any_skip_relocation, ventura:       "efb0f51303a39f28af0554e1fc47e8fe262042f66e6134c5c94a599bfd68b82c"
    sha256 cellar: :any_skip_relocation, monterey:      "d3dc442974eae3b6af8f4bbb4fe7fbafc31cf8e170f8b171033d7f408b55d626"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "57991b80cbde8735fb4f6a42de3ce9edcc75aa8588d2c66b68fddb46873c09df"
  end

  depends_on "rust" => :build

  on_linux do
    depends_on "pcsc-lite"
  end

  def install
    chdir "cli" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    system "#{bin}/jpki-cli", "-V"
  end
end
