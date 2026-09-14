cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.0.12"
  sha256 arm:   "087e4ea7b104e6627c2fc666b0a090f0997c5ea3df94bd7683eab30fb0517015",
         intel: "2943cb5cce41555242f13e20892baf9b1287f596298d40f2cedadcdc9dbea4b0"

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
