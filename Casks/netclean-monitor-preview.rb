cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.0.5"
  sha256 arm:   "068cd7a7d55c2f5602e2edb34131e0a8f2d56ef2e2ed3a010c67c22d1e3eae5f",
         intel: "d0516a788be717ab8222bf9710500fd3a5ca3fded2a2ef7e5d03c6241218831a"

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
