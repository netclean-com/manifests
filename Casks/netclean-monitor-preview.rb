cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.35"
  sha256 arm:   "67c25c84d18a6d45754a0a0ccb28d8a1bc9449755fb55ee217204f6e628818c1",
         intel: "11fc9fd024bb16b68c206a2cb4c757ff65ca45cd101cb8cd60011ca0c447772f"

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
