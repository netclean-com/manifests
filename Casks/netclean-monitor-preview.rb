cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.317"
  sha256 arm:   "4206f7b0386b692e2bc67c29f864aa33c73e151424c24793f4959907cfcf1570",
         intel: "573220472d03d8eb39a765fc5ac01a0e534cdf8cc35ab4cff6a5ee253f6a9eb4"

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
