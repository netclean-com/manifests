cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.277"
  sha256 arm:   "dc1a1c61a91e1eac2aefc9d2ee929aa9b5fbb2f0fdc1e5dee5ec5045e4f340f7",
         intel: "5154e3744093a990d655182a7b3c6187315e09083b54a74062af510d32404121"

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
