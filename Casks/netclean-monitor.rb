cask "netclean-monitor" do
  arch arm: "arm64", intel: "x64"

  version "0.1.5"
  sha256 arm:   "ebc47f7d6ae6bb532c896e787b5c7b03263fb6c99a7e08a66d332a92daafe0a9",
         intel: "3d09ee1691f6c46e53daf44bb1227f5682c33c6f5f4a33c42eee76c5c6267fae"

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
