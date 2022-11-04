class Rsgain < Formula
  desc "A simple, but powerful ReplayGain 2.0 tagging utility"
  homepage "https://github.com/complexlogic/rsgain"
  version "3.1"
  url "https://github.com/complexlogic/rsgain/releases/download/v#{version}/rsgain-#{version}-source.tar.xz"
  sha256 "c1ab2c2162c1046786254090f939d60da87994efad5715dde68aa5247f33eaa3"
  license "BSD-2-Clause"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "ffmpeg"
  depends_on "libebur128"
  depends_on "taglib"
  depends_on "inih"
  depends_on "fmt"
  
  patch do
    url "https://raw.githubusercontent.com/complexlogic/homebrew-tap/master/macos_fix.patch"
  end


  def install
     system "cmake", "-S", ".", "-B", "build", *std_cmake_args
     cd "build"
     system "make", "install"
  end

  test do
    assert_equal "rsgain #{version} - using:", shell_output("#{bin}/rsgain -v").strip
  end
end
