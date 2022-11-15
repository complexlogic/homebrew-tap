class Rsgain < Formula
  desc "A simple, but powerful ReplayGain 2.0 tagging utility"
  homepage "https://github.com/complexlogic/rsgain"
  version "3.1.1"
  url "https://github.com/complexlogic/rsgain/releases/download/v#{version}/rsgain-#{version}-source.tar.xz"
  sha256 "0c9efdf7433943f2e3674a6859eb72c80fede333b5e86151eaa0492e83923d5a"
  license "BSD-2-Clause"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "ffmpeg"
  depends_on "libebur128"
  depends_on "taglib"
  depends_on "inih"
  depends_on "fmt"
  
  def install
     system "cmake", "-S", ".", "-B", "build", *std_cmake_args
     cd "build"
     system "make", "install"
  end

  test do
    assert_equal "rsgain #{version} - using:", shell_output("#{bin}/rsgain -v").strip
  end
end
