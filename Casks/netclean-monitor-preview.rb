cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.314"
  sha256 arm:   "65ff14e726687daf7421664c97a9c4b9b33d850a051e827f265d85c55dddce27",
         intel: "3c661abeabc5197e557a471dd1f687853396ab64bd54d910d3b2e6b0a3372491"

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
