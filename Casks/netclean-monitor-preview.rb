cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.315"
  sha256 arm:   "69cfb8dc00a7c38329fb4dd1478a7cfd2cae2bccee0798b2a89dfcf5f9af3a83",
         intel: "fe6478256cbd85dcfa1a727ad7766c9929356317ffc808f7d7687eb90dd8039e"

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
