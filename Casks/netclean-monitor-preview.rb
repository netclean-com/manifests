cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.356"
  sha256 arm:   "aea2a1a6d7402f4bfbab2d683e415f4c1044d9a3324bf385e4181b8a9173cf5a",
         intel: "ab914dd856a7702416f0bd086bedfd47cd8c923c42b2cb47acaa9c6d3b438410"

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
