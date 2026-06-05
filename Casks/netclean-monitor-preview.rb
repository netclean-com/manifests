cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.310"
  sha256 arm:   "06dd98f79add808734a10441f60e5175f4e1e704eb281bd6aa5ba0b245f04de6",
         intel: "45a2b38b8f4f83c870f0623ddfecdd4b504782bec0e49588b689887f4066c764"

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
