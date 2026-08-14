cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.383"
  sha256 arm:   "5c479ce97eaf96c2ba3eeaca4fedceb803b01e6a2154dfc10119a5e1b75d9b96",
         intel: "2406d54f0980f0d24c34e929aec9b58f9ffb23c5d8c3d7f75b3dabd535d1ee84"

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
