class Kmpc < Formula
  desc "An M3U music playlist converter for Kodi"
  homepage "https://github.com/complexlogic/kmpc"
  version "1.0"
  url "https://github.com/complexlogic/kmpc/archive/refs/tags/v#{version}.tar.gz"
  sha256 "c4a8de417e59b3225edb3996c98b7ababc97a8b92f5ab80b57b74d8f188ead11"
  license "Unlicense"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "qt"
  depends_on "fmt"
  depends_on "sqlite"

  def install
     system "cmake", "-S", ".", "-B", "build", *std_cmake_args
     cd "build"
     system "make", "install"
  end
end
