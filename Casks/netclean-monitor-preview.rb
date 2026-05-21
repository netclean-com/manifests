cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.272"
  sha256 arm:   "5853fa225d6d53a2d7bd65eabcdaf446a489c397caee8de4da9e28eb78d1d949",
         intel: "06b7717febcbadac913175a28b30fe9a80301401d74de1f56fdf434016c9d10b"

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
