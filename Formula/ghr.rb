class Ghr < Formula
  desc "Yet another repository management with auto-attaching profiles"
  homepage "https://github.com/siketyan/ghr"
  url "https://github.com/siketyan/ghr/archive/refs/tags/v0.4.5.tar.gz"
  sha256 "d3a02931fdc8a7908fb723f231a41b8fb180b1a63dcd2f5a9b30219e97f67557"
  license "MIT"

  bottle do
    root_url "https://github.com/s6n-jp/homebrew-tap/releases/download/ghr-0.4.5"
    sha256 cellar: :any,                 arm64_sequoia: "402cbbea8bf9490a37a882b6c263d83dca3357ed8e81baacc6fadc23480b54f7"
    sha256 cellar: :any,                 arm64_sonoma:  "e14c5a9ab62582e584b6057ff841084f96b591eb033753b7a4af141100ff2989"
    sha256 cellar: :any,                 ventura:       "13384a5b1d60b6b3afe7f0e12fd35336fe8f2a6debc23548cdb075635cd8a8fd"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "c1c6e765cdac4d36fbadf58aeddb6692e51599e4492fc85a50528197443e833d"
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
