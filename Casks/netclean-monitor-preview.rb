cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.367"
  sha256 arm:   "3fddaef2cdb3e33004a7a72f91df3d1c56662c45108a7243574fe32b4b217c3c",
         intel: "7e1f84fec083620786fca293fee34ee5308b3a4cb8717e21d7e1c5cfbd27cd19"

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
