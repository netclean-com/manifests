cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.326"
  sha256 arm:   "fe5d34c1ab1d4addeb7b801994d3d30424b04871c47ee10d7fe3253f673bb7ff",
         intel: "4345ad942f86b77160a4df803555b1f0de3d5f27aad18642c9aaf9b62651a80d"

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
