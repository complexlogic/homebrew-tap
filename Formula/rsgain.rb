class Rsgain < Formula
  desc "A simple, but powerful ReplayGain 2.0 tagging utility"
  homepage "https://github.com/complexlogic/rsgain"
  version "3.2"
  url "https://github.com/complexlogic/rsgain/releases/download/v#{version}/rsgain-#{version}-source.tar.xz"
  sha256 "179d0a132bcc8d64e354ef41495409d517b2b22fecbea64672e2fcdfe6dfe3d4"
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
