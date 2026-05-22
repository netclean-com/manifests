cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.278"
  sha256 arm:   "51067b2314b38b82c472f1189b54e096b6e1416146bbc0d271a3aed7c1c87a7a",
         intel: "2c1bf5048c76d4399fb3891d0388086e59ee7ba54056c2e368b5cb0ddcc79af5"

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
