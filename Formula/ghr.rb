class Ghr < Formula
  desc "Yet another repository management with auto-attaching profiles"
  homepage "https://github.com/siketyan/ghr"
  url "https://github.com/siketyan/ghr/archive/refs/tags/v0.4.3.tar.gz"
  sha256 "18c149bb317c71450343f1e7e514dea60ea001a309510e9aff166a7898542c04"
  license "MIT"

  bottle do
    root_url "https://github.com/s6n-jp/homebrew-tap/releases/download/ghr-0.4.3"
    sha256 cellar: :any,                 arm64_sonoma:  "b296d36f2bb7d21f42ba0fdf30b5f07b306d37bed57b6d0112d4134a0b12be92"
    sha256 cellar: :any,                 arm64_ventura: "063b51b898e11434f29323108753948d4d54671fb149b2a01760087582ffebc2"
    sha256 cellar: :any,                 ventura:       "a66761527fec6279f47c22f41e8f8841e96f656c0e497d6623eb9691b348308f"
    sha256 cellar: :any,                 monterey:      "70e1089a9339f0de771949128011b4a3a04ad554647078bc59fb8949bbae00a9"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "412b5e6247e8a4cc243cf50cd64be1442c1ad1855302c444446639b8c9fd05ec"
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
