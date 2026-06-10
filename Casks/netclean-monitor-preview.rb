cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.327"
  sha256 arm:   "310b2028a6a9cc27342efdb72fa9ed033cf8c5fd40d66dcc0c1677eb85c606c9",
         intel: "969708d5381e2cdf4a003948aa52e21f46305f9cb97c3e9a958f89939fc8379c"

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
