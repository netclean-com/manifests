cask "netclean-monitor" do
  arch arm: "arm64", intel: "x64"

  version "0.2.6"
  sha256 arm:   "c0f260caf0dcde2141d135b2f0452afcaceae59de9308b04aa1fe3fa5d027210",
         intel: "a9033c6e93d0b555ea2dbf8b77d29cb5c4a2b4fe56317f5ec842ebdfed34a80c"

  url "https://cdn.netclean.cloud/releases/monitor/stable/#{version}/netclean-monitor-#{version}-#{arch}.pkg",
      verified: "cdn.netclean.cloud/releases/monitor/"
  name "NetClean Monitor"
  desc "Background monitoring daemon by NetClean Technologies AB"
  homepage "https://www.netclean.com/"

  livecheck do
    skip "Version is managed by the automated promotion workflow"
  end

  conflicts_with cask: "netclean-monitor-preview"
  depends_on macos: ">= :sequoia"
  depends_on arch: [:arm64, :intel]

  pkg "netclean-monitor-#{version}-#{arch}.pkg"

  uninstall script: {
    executable: "/bin/sh",
    args:       ["/Library/NetClean/Monitor/uninstall.sh"],
    sudo:       true,
  }
end
