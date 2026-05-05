cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.0"
  sha256 arm:   "a2a9906c3aace4b915b5beaa1812596b61e27c5db499717083f7e54562b2a3f6",
         intel: "c63d502598f2f084d49a700e9bf8240fca863019e21f14bbc99bcd2597ec7ba6"

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
    executable: "/Library/NetClean/Monitor/uninstall.sh",
    sudo:       true,
  }
end