cask "netclean-monitor" do
  arch arm: "arm64", intel: "x64"

  version "0.1.6"
  sha256 arm:   "f4b777024336b767cec3279a818d026cc73f57fbaaae47c37054643748116d8f",
         intel: "50fe4301907b79d3f92c36efd7f1c8576d77b3f7a5810cdd51540719a9a1a3b8"

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
