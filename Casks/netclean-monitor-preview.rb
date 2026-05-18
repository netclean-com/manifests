cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.269"
  sha256 arm:   "bda4ad72861053dc90b6cc1295468cbd8989ab5dda371369505a2c9a0c307601",
         intel: "e7f5a392c61533d1dc107f1bb22a0e5d34b0f8135f35a01d9ffe4c191800e7d4"

  url "https://cdn.netclean.cloud/releases/monitor/preview/#{version}/netclean-monitor-#{version}-#{arch}.pkg",
      verified: "cdn.netclean.cloud/releases/monitor/"
  name "NetClean Monitor (Preview)"
  desc "Background monitoring daemon by NetClean Technologies AB (preview channel)"
  homepage "https://www.netclean.com/"

  livecheck do
    skip "Version is managed by the automated release pipeline"
  end

  conflicts_with cask: "netclean-monitor"
  depends_on macos: ">= :sequoia"
  depends_on arch: [:arm64, :intel]

  pkg "netclean-monitor-#{version}-#{arch}.pkg"

  uninstall script: {
    executable: "/bin/sh",
    args:       ["/Library/NetClean/Monitor/uninstall.sh"],
    sudo:       true,
  }
end
