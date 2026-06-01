cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.294"
  sha256 arm:   "bbab6c2e082ef634a22d761b17a205a89501622659f73f2c3ad357e33ad6b58c",
         intel: "5d53180efba7d2929f1f17b560e99d18fbda754b36a9095984c1d4eef84e0ef3"

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
