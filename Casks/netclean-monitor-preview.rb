cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.0.25"
  sha256 arm:   "ad46101f587c02852a494f0d7b774d113ada46cbaa6396b5ff7c47b1d21b5750",
         intel: "dbc74e6f4171fecb492a951ce834edc050df7042b99f8d7ca23f708c2a0be05c"

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
