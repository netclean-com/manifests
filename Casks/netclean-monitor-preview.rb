cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.400"
  sha256 arm:   "a12f7947302932506cee4e61154c48d8a7c95959f05402c536148e7bb97e6b16",
         intel: "949f938003abd2e3ccdee0952fac92c6e3a97fa855644b799ab895eee0ba8657"

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
