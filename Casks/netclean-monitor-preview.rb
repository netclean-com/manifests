cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.328"
  sha256 arm:   "d4ca3f5f612e89620f350bf1f706bfb14255f68eb8bbd89b6e070479d72ca2c0",
         intel: "bb09557950fb7db09743cbc1b7204570d1c406ef787d598d9e3786840ce1f88b"

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
