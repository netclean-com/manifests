cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.402"
  sha256 arm:   "e8a23ad89cd0e7365f1074f6d14d2fd3c54200f8205f88cdb86e17d8c90e5de2",
         intel: "301a97e0e65ecff7541462cefaf6949bf78e78b9ba2ad29148865015ab4f67c9"

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
