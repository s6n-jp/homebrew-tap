class Ghr < Formula
  desc "Yet another repository management with auto-attaching profiles"
  homepage "https://github.com/siketyan/ghr"
  url "https://github.com/siketyan/ghr/archive/refs/tags/v0.4.4.tar.gz"
  sha256 "42c678ecbf48a4d43be42a2c4a1682ffd964b14b62bd95acbd0e44aef4dc6835"
  license "MIT"

  bottle do
    root_url "https://github.com/s6n-jp/homebrew-tap/releases/download/ghr-0.4.4"
    sha256 cellar: :any,                 arm64_sonoma:  "32373874a1e01db9fdcb6485aa4ba65f8218e82384da213cf71dc568d2d7ccbc"
    sha256 cellar: :any,                 arm64_ventura: "c0a0ffb92041d34226513bd3e2d2d501710165ea2c470751b86e26e3998d2b04"
    sha256 cellar: :any,                 ventura:       "485a4e824db3a9b6e0ce084d13821b10a4361bc1ac2f29f89bbd64e9c9efaaec"
    sha256 cellar: :any,                 monterey:      "8cc3b11e9e75c24f5ddc0f9481bcdc68ca2577372f6b818d980d903b0b98ad40"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "1dff71f178f88241c9d868ff549bcfc6c1f2f3dc1e2ccce05f886e92718ef85f"
  end

  depends_on "rust" => :build
  depends_on "libgit2"
  depends_on "openssl@3"

  on_linux do
    depends_on "pkg-config" => :build
    depends_on "zlib"
  end

  def install
    system "cargo", "install", *std_cargo_args

    bash_completion.install "resources/shell/bash/ghr-completion.bash"
    fish_completion.install "resources/shell/fish/ghr-completion.fish"
  end

  test do
    system "#{bin}/ghr", "version"
  end
end
