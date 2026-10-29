cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.19"
  sha256 arm:   "475d8555bd0100d12730795db36fc595d7aa014aebc5beaa49d6cd03993bce80",
         intel: "f9f4582925c90dd86367ce7dbd378b9d8e3c4071a384c9f774ac8e4353b5a410"

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
