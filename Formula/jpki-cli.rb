class JpkiCli < Formula
  desc "Read certificates, sign and verify documents using your JPKI card"
  homepage "https://github.com/siketyan/jpki-rs"
  license "LGPL-2.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/siketyan/jpki-rs/releases/download/0.3.0/jpki-cli-x86_64-apple-darwin.tar.gz"
      sha256 "6afc3d1de0666c782aae7c94c19f5e3f2b0b0b2b27d48b632bc77b187afa24bb"
    else
      url "https://github.com/siketyan/jpki-rs/releases/download/0.3.0/jpki-cli-aarch64-apple-darwin.tar.gz"
      sha256 "9dcbd0a02b79d279932694b5bf40a1266c17b3db021f9e863b6c60640f3cc7b3"
    end

    def install
      bin.install "jpki-cli"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/siketyan/jpki-rs/releases/download/0.3.0/jpki-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "47f77a6d374059caa48566806fc72e30c5e53a876b0851c9ac49bc07d5ae8117"

      def install
        bin.install "jpki-cli"
      end
    end
  end

  test do
    system "#{bin}/jpki-cli", "-V"
  end
end
