class Qrean < Formula
  desc "A portable QR and Barcode generation / manipulation library written in C."
  homepage "https://github.com/kikuchan/libqrean"
  url "https://github.com/kikuchan/libqrean/archive/4d77933.tar.gz"
  version "v0.0.0-4d77933"
  sha256 "9a442c83af29408b6e376c9232f9244122ef6ce8f1b81da10246054571881f97"
  license "MIT"

  depends_on "make" => :build

  def install
    system "make", "install", "PREFIX=#{prefix}"
    bin.install_symlink "#{prefix}/qrean"
  end
end
