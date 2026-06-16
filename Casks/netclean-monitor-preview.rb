cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.333"
  sha256 arm:   "ac6207704626730bbc32f9cf15e8cc7069a45cfcf9d8da79fdd62e934467e21b",
         intel: "b65c625e09aa977360e2990338c9f10d6b95eb4a0bb1e4b7cb576308fc16b5de"

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
