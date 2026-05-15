cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.268"
  sha256 arm:   "f6b49c45bfa828d3bd0a0fd74d6f609db46e683c8844496762d259515c9b963f",
         intel: "9ba00c445b6c256229b9497f5d51048e296a207fc53acc0e18cfca50bca6a388"

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
