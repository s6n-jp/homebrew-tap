class Ghr < Formula
  desc "Yet another repository management with auto-attaching profiles"
  homepage "https://github.com/siketyan/ghr"
  url "https://github.com/siketyan/ghr/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "18876e3bb824e4eacf6274e23bfce01821f991a2d4feb56a18b3e19e3a952355"
  license "MIT"

  bottle do
    root_url "https://github.com/s6n-jp/homebrew-tap/releases/download/ghr-0.3.11"
    rebuild 1
    sha256 cellar: :any,                 arm64_ventura: "2a7a78f2be4153d6e5353d667d465abb51c7d128443363ece6321769de1d5eda"
    sha256 cellar: :any,                 ventura:       "9d44ea3c3688201a551126c48de599acd66f21079df5eca9ba69e3840b16b7ff"
    sha256 cellar: :any,                 monterey:      "df04fa5307568ceb14e7dbc89cc1e88e50afad3cc59f09257f1babd2dd8efbb7"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f1b60992dbfe72fa0941bd062dc9309ef446324cf93bcac9d9cd0e6c24d838af"
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
