class NetcleanMonitorPreview < Formula
  desc "NetClean Monitor (Preview)"
  homepage "https://www.netclean.com"
  version "0.0.1"

  on_arm do
    url "https://cdn.netclean.cloud/releases/monitor/preview/0.0.1/monitor-macos-arm64.pkg"
    sha256 "REPLACE_ME_PREVIEW_ARM64_SHA256"
  end

  on_intel do
    url "https://cdn.netclean.cloud/releases/monitor/preview/0.0.1/monitor-macos-x64.pkg"
    sha256 "REPLACE_ME_PREVIEW_X64_SHA256"
  end

  def install
    pkg = Dir["*.pkg"].first
    system "sudo", "installer", "-pkg", pkg, "-target", "/"
  end

  test do
    system "pkgutil", "--pkg-info", "com.netclean.monitor"
  end
end
