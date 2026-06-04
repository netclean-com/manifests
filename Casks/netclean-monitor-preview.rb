cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.307"
  sha256 arm:   "da37bb39305633f391f3b8995a7e7822842bde53cb2560d8a901771ca5bbbd6a",
         intel: "93a2900b20e2143b72b4bcb6fc5aa4167c8f7d725974dcaef14a7da9b93d42f6"

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
