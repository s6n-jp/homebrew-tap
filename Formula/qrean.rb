class Qrean < Formula
  desc "Portable QR and Barcode generation / manipulation library written in C"
  homepage "https://github.com/kikuchan/libqrean"
  license "MIT"
  head "https://github.com/kikuchan/libqrean.git", branch: "main"

  depends_on "make" => :build

  def install
    system "make", "install", "PREFIX=#{prefix}"
    bin.install_symlink "#{prefix}/qrean"
  end
end
