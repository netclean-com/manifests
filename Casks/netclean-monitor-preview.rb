cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.386"
  sha256 arm:   "4fb4bdc730d4e280d26765c4548fcbd77418eca1184ef77d2b2e95d0254328ec",
         intel: "6cc7fbaa39912b4a5d06a9ca4d7a6f0113ec3c4ee5c9ae9187b2ac58efe079ba"

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
