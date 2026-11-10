cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.41"
  sha256 arm:   "5f54f0c1a3f905180e0c6850a51604cffc8faf6e3bc1c8bdad7c2d37b0e1f413",
         intel: "52da33fc8726d7abbe6c21c6857cb4cb56b80b46ae47dfd66086b62da3775e35"

  url "https://cdn.netclean.cloud/releases/monitor/preview/#{version}/netclean-monitor-#{version}-#{arch}.pkg",
      verified: "cdn.netclean.cloud/releases/monitor/"
  name "NetClean Monitor (Preview)"
  desc "Background monitoring daemon by NetClean Technologies AB (preview channel)"
  homepage "https://www.netclean.com/"

  livecheck do
    skip "Version is managed by the automated release pipeline"
  end

  conflicts_with cask: "netclean-monitor"
  depends_on macos: :sequoia
  depends_on arch: [:arm64, :intel]

  pkg "netclean-monitor-#{version}-#{arch}.pkg"

  uninstall script: {
    executable: "/bin/sh",
    args:       ["/Library/NetClean/Monitor/uninstall.sh"],
    sudo:       true,
  }
end
