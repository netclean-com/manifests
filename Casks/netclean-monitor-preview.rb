cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.270"
  sha256 arm:   "a3e32a9dbc6dc287abbd514d1db90298a2581ca90061081a2595e7c05cc14639",
         intel: "0aa9b8691db23f92f86183348676f929cb2ff8e89dc8b1c2bf83beb396d3d0e7"

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
