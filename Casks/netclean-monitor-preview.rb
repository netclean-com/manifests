cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.292"
  sha256 arm:   "722fc82f75ba50fd72f75f01f3ac4cf279df429cee6f6ecda39a4646d00815ce",
         intel: "06eb026dd60c8f04059a1b79e5d45e8b913abe0a20861fb0e88d47c702d92407"

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
