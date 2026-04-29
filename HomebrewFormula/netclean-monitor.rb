class NetcleanMonitor < Formula
  desc "NetClean Monitor"
  homepage "https://www.netclean.com"
  version "0.0.0"
  license :cannot_represent

  on_arm do
    url "https://cdn.netclean.cloud/releases/monitor/stable/0.0.0/netclean-monitor-0.0.0-arm64.pkg"
    sha256 "6edf932c65d3c7eaa4363421bb6f89b921b765fb4b9fe68f750bf4b5f2ac6b41"
  end

  on_intel do
    url "https://cdn.netclean.cloud/releases/monitor/stable/0.0.0/netclean-monitor-0.0.0-x64.pkg"
    sha256 "a356c2afeb3578133f612a5a1cbc9ef26b6cf20646981642a4c6730820e8d50e"
  end

  def install
    pkg = Dir["*.pkg"].first
    system "sudo", "installer", "-pkg", pkg, "-target", "/"
  end

  test do
    system "pkgutil", "--pkg-info", "com.netclean.monitor"
  end
end
