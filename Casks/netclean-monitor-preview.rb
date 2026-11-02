cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.27"
  sha256 arm:   "23a9aac1c3d7818722b8fbdf1ce10a641d02db1b415fef0fb95aff616b213f9b",
         intel: "cd5ee8b28cdc6bb5e627cbea17411fe0e800bedaba6e18c07cc993c6461d0fee"

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
