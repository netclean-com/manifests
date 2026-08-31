cask "netclean-monitor" do
  arch arm: "arm64", intel: "x64"

  version "0.2.10"
  sha256 arm:   "41a9843599be82b7ea2d0723911c0c17c6e6b836fb2f9083d0b5de30f20acdc7",
         intel: "141cd2f611c0ec457c46fd2eb48d5bd8be857b871ffe0ba3e570a04be3588ee4"

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
