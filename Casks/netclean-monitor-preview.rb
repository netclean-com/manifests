cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.319"
  sha256 arm:   "b5b9102d507c68fa7334cc5c2ff5d2cadebb9870ae356060c2266e380462e53a",
         intel: "71d0ce4fa8ff8510a7cf0405f20f39eca32969bab83c7883d66d69f9902b7829"

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
