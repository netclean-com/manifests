cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.53"
  sha256 arm:   "7a53313487be27ac1cc360373fed793d6664381aea4d20f2c6a33340c6a144f5",
         intel: "ba4728d67259af98ed8eae51555dc76b2e30256950d0e52ab37b67225b28b61f"

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
