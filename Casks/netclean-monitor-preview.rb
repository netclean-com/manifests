cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.6"
  sha256 arm:   "2a7e3c841d198366fd5eed7b289602539539df3e98b87ee3d45eb2b85b395ef2",
         intel: "5faecebe2e4b83d01ef1416281e533ea9d3170add99787fb27e0ecba78b09460"

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
