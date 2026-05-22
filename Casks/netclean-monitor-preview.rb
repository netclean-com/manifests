cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.273"
  sha256 arm:   "1cfc527b45c5ac42f3cac34feecd1d933d21110bd1a35788c8002b3e02f50060",
         intel: "5c7881426920651e26eafac1374cb4a7a54d76ce5e61b7727659ac68b45504b2"

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
