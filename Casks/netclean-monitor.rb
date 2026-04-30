cask "netclean-monitor" do
  arch arm: "arm64", intel: "x64"

  version "0.0.0"
  sha256 arm:   "6edf932c65d3c7eaa4363421bb6f89b921b765fb4b9fe68f750bf4b5f2ac6b41",
         intel: "a356c2afeb3578133f612a5a1cbc9ef26b6cf20646981642a4c6730820e8d50e"

  url "https://cdn.netclean.cloud/releases/monitor/stable/#{version}/netclean-monitor-#{version}-#{arch}.pkg",
      verified: "cdn.netclean.cloud/releases/monitor/"
  name "NetClean Monitor"
  desc "Background monitoring daemon by NetClean Technologies AB"
  homepage "https://www.netclean.com"

  livecheck do
    skip "Version is managed by the automated promotion workflow"
  end

  conflicts_with cask: "netclean-monitor-preview"

  depends_on macos: ">= :sequoia"
  depends_on arch: [:arm64, :intel]

  pkg "netclean-monitor-#{version}-#{arch}.pkg"

  uninstall script: {
   executable: "/Library/NetClean/Monitor/uninstall.sh",
   sudo:        true
 }
end
