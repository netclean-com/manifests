cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.2.2"
  sha256 arm:   "cc1012e3c43d55edd2c4787bf02c07c564dfe7922d36a6ebfc3c561a1d922b2c",
         intel: "cd4bd2189b87a4a8eb1de8a044497b064947d3d92668dc8417f188e06aa0024f"

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
