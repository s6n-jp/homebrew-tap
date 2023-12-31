class Ghr < Formula
  desc "Yet another repository management with auto-attaching profiles"
  homepage "https://github.com/siketyan/ghr"
  url "https://github.com/siketyan/ghr/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "18876e3bb824e4eacf6274e23bfce01821f991a2d4feb56a18b3e19e3a952355"
  license "MIT"

  bottle do
    root_url "https://github.com/s6n-jp/homebrew-tap/releases/download/ghr-0.4.1"
    sha256 cellar: :any,                 arm64_ventura: "c27be7020b3450ee0b4259b930b4ba99f9a4a847400bd6311e3e8f029074fb47"
    sha256 cellar: :any,                 ventura:       "244855cfbdc2a22008a8077fb822dfe7f8cc214237ee37294c826fe1d3e08b58"
    sha256 cellar: :any,                 monterey:      "dddca4831d97fc35a1c468aeaaf4eae9fde05b233d750090d994e561d498be57"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "0dddb9f29321aed9813f75a99db8068ea0966d78c7a66a62c2db154f3b156be7"
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
