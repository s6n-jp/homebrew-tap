class Qrean < Formula
  desc "Portable QR and Barcode generation / manipulation library written in C"
  homepage "https://github.com/kikuchan/libqrean"
  url "refs/heads/4d77933"
  version "0.0.0-4d77933"
  sha256 "f1021db34e41f7a1749672945dd2b77235bd04184376f8ccfff07e613a53685d"
  license "MIT"

  depends_on "make" => :build

  def install
    system "make", "install", "PREFIX=#{prefix}"
    bin.install_symlink "#{prefix}/qrean"
  end
end
