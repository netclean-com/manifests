cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.263"
  sha256 arm:   "ed206d38e2012ed9df05400f49dcd516edd496ac6f2b25a4d144512248dde59c",
         intel: "26041bc189d6a2befcec5ca90020ee98c051b3bb6e79430403db8ad25097a0f9"

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
