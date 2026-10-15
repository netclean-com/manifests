cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.15"
  sha256 arm:   "b2eb23b1c5124d0c7d4150aa661b67cc29e0f9f14e4639da7bcf8373dbc21b99",
         intel: "b3c4a8e0503f9e112c27c952f01068b92b1c6287827cc4a630596a588454742d"

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
