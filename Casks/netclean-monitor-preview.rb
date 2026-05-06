cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.253"
  sha256 arm:   "69759811a7d1d7f28cd05a9439ba876329b90737de01a5abd5915a72ffff8b19",
         intel: "96d316ca5531be3ac27401250765541285a30f622f38ce0b3437a0a41cd8c6ca"

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
