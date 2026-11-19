cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.60"
  sha256 arm:   "cec1fb7d5664d345ef81e6ae30d14bf3627693e7f1a02c62397db176811300d3",
         intel: "87888c716e2b6fb172c1fe7a0084825c14adf9e8c48c8e8a7918066e541e5936"

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
