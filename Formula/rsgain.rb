class Rsgain < Formula
  desc "A simple, but powerful ReplayGain 2.0 tagging utility"
  homepage "https://github.com/complexlogic/rsgain"
  version "3.0"
  url "https://github.com/complexlogic/rsgain/archive/refs/tags/v#{version}.tar.gz"
  sha256 "e4f81a4ab68d384750084d795ea5b330c8c0caf8e1e1f18782aedafabb309715"
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
