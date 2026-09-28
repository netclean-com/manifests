cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.8"
  sha256 arm:   "9ffa4292c14e511cd66d3a1aa6a43c45eff535c06676f19da485dd5b7c6ef82b",
         intel: "cf27802373cbbf63ad0b961fef16b0b2c83a2449c9520e9ef3cfe4ea639dacaa"

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
