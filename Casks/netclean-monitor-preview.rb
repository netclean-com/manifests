cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.380"
  sha256 arm:   "5645824dab6b00d57ceab7dc8491fb7f5d7b1296d95b494be0898955d665c346",
         intel: "9f576211d9eeacee74b2d7e36e43e3aaa1fcebb6348d573eb4a32b2e762648a4"

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
