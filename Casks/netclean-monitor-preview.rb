cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.12"
  sha256 arm:   "a37193c1fd0d88eb22def2a0a6a4c01239faea1fd7dcd66768a506d804491b85",
         intel: "64bbbdd05a15578b75647af13c9688ba7ba3f6ecf8df5d4fc7d5a32fad041553"

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
