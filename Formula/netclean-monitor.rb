class NetcleanMonitor < Formula
  desc "NetClean Monitor"
  homepage "https://www.netclean.com"
  version "0.0.1"

  on_arm do
    url "REPLACE_ME_ARM64_URL"
    sha256 "REPLACE_ME_ARM64_SHA256"
  end

  on_intel do
    url "REPLACE_ME_X64_URL"
    sha256 "REPLACE_ME_X64_SHA256"
  end

  def install
    pkg = Dir["*.pkg"].first
    system "sudo", "installer", "-pkg", pkg, "-target", "/"
  end

  test do
    system "pkgutil", "--pkg-info", "com.netclean.monitor"
  end
end
