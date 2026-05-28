cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.290"
  sha256 arm:   "13a0103abdf1f5058f33ff86651006c5d030efc50ad9118910b7b6b4bf4ef52d",
         intel: "53f26008e8f749a3993b314024e172ffd2c4cf75a1255d03bb52696322404216"

  url "https://cdn.netclean.cloud/releases/monitor/preview/#{version}/netclean-monitor-#{version}-#{arch}.pkg",
      verified: "cdn.netclean.cloud/releases/monitor/"
  name "NetClean Monitor (Preview)"
  desc "Background monitoring daemon by NetClean Technologies AB (preview channel)"
  homepage "https://www.netclean.com/"

  livecheck do
    skip "Version is managed by the automated release pipeline"
  end

  conflicts_with cask: "netclean-monitor"
  depends_on macos: ">= :sequoia"
  depends_on arch: [:arm64, :intel]

  pkg "netclean-monitor-#{version}-#{arch}.pkg"

  uninstall script: {
    executable: "/bin/sh",
    args:       ["/Library/NetClean/Monitor/uninstall.sh"],
    sudo:       true,
  }
end
