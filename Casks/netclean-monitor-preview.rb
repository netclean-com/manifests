cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.316"
  sha256 arm:   "7a49abbf6d3df5d88e796fcc4dc7ff43ef738b3ab3acb7b03650d9c26c8ce2f0",
         intel: "b801283295a6181246113289595b97ecd21ebb66e1897eede420398580358696"

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
