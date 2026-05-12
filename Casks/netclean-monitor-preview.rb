cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.265"
  sha256 arm:   "e19bd4fe50f717dfaa63648222385ba01d6f4d05c7c113b740ddb25137bd26bd",
         intel: "d8dd5dd213e0275d8d1af5622cb0b353e8d931f91b1e81a8b8202d7ecd1c6a9e"

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
