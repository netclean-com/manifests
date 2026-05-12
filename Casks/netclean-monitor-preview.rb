cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.259"
  sha256 arm:   "a324a529beacf3cc7cb695f77e880bc316057e02bc3795cdf618c43feb558686",
         intel: "db3b3a64c3c5a23a55aef83ec8fb24f00d6c67a9c1498ec636d1d394009a3220"

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
