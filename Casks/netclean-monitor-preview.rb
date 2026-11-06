cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.38"
  sha256 arm:   "0ff9f27653bc2204da289f62d6e55ec97298db4f6dbd03b3351b0e58ae30148b",
         intel: "5e1f132ea4df51306e4e2d4208310b7877169d15c73157791e3131b5b73dcab4"

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
