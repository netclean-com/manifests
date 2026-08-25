cask "netclean-monitor" do
  arch arm: "arm64", intel: "x64"

  version "0.1.7"
  sha256 arm:   "ca7ffb381f2d80e056d9af64d62d60452fc8e416354a3d317fd211663183ab76",
         intel: "80b9cc5cebf9dc577c264a8e42c5a26501ba710af3114c778adce6a1ae68dd2f"

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
