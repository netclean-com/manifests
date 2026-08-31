cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.2.9"
  sha256 arm:   "f6445087dde7d20f8befb8997adbee18d2c5d35c5dcbc4ad125b7a7b90f52308",
         intel: "e108080ff72f99d50546dba3141cd275d35554f22ae71fe6bde2890748e24b8b"

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
