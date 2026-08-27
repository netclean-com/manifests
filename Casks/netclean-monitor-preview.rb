cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.1.14"
  sha256 arm:   "2ce063b9bd608d993cd28189d84a4edaf006d655206774be0bc7e2372b3b2a1d",
         intel: "469add9210aba581a8ed2b70c2bf6e0e1c8148042d7e830f1b62067d4e74a868"

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
