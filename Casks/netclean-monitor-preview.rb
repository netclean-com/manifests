cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.0.10"
  sha256 arm:   "c39324d723eab8a1f3db583f05caec54eace9812b84e71e40523de923fa8790a",
         intel: "22c7b0bda0052a8696c1ab263a9ae4eabeba20e0eddfda85b39c508ddc22e628"

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
