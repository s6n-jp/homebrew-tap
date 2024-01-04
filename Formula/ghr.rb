class Ghr < Formula
  desc "Yet another repository management with auto-attaching profiles"
  homepage "https://github.com/siketyan/ghr"
  url "https://github.com/siketyan/ghr/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "fbf93db6258d5bd9501a9561f476cea82b1d46ef325c7be3ca9b548d5026c989"
  license "MIT"

  bottle do
    root_url "https://github.com/s6n-jp/homebrew-tap/releases/download/ghr-0.4.2"
    sha256 cellar: :any,                 arm64_ventura: "163034da472a1e7c6ecde119e56bb4707bdeee2019e3f4ad505c8791a37d3326"
    sha256 cellar: :any,                 ventura:       "8fcc89c0cc48751cea983f1e6e6d45b687abaa0f28df7b18aa91e8eeadb724f2"
    sha256 cellar: :any,                 monterey:      "d83c758d354677baa1443498fdc2e134ac772a50e3f2b07a8acad9633634e0ef"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "c3d0edab94d15c2d0d8ff8ee09fa65f1e66a4f8b5ba8485a11e7dd1f433890d5"
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
