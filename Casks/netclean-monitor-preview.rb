cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.0.22"
  sha256 arm:   "c99fbe39b1c8ead18454826e1d9e66a8e31de328a866873bf53e5cab9c34fc16",
         intel: "7903ba1e6c4b1219d0c5591b0d073636bd26ac2a2aa6f7d1c71f5593bd1231d3"

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
