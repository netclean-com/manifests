cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.56"
  sha256 arm:   "ef07534e53df322b20b81c01442b98bae0e3ee38380cdb0eeb5f96888b2a1733",
         intel: "bfc784187db778e72f284b5a6fdf03625456fdfb1703e07927ac5bdcb1dd6632"

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
