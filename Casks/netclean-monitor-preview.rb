cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.330"
  sha256 arm:   "e5f04803c55eb9622fe29c9beb770ec42f21ed73138b648394a81ccdc85be325",
         intel: "f5c8324a1aa08052fbeecbb7f473d460b646e1c30e6495f3f0925d919350ba59"

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
