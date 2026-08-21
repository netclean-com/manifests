cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.393"
  sha256 arm:   "fa36ce041dd085d80d3629b5ac0194a5cbc13547051817f41be1ce5dbce2b859",
         intel: "802c4cb95753cb2f3b6f3c44cf59e7a1eeaae2ee7a94bbf9bcc5a6620ccb1ce0"

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
