cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.288"
  sha256 arm:   "dc7961371db06caec3e1eebb5da10cb18e46575bce8ef8c9fbd53c8e0a5d571d",
         intel: "18214cec33052bc4bd893f9137c45733e286e17d7165cada79458a4cc32280e7"

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
