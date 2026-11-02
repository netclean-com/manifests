cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.28"
  sha256 arm:   "515396c2a993d1b22aac9326927a43d328a0d5cd7aed9608862a2b5b8a455db2",
         intel: "246afa4882262ff2a94c6696ade3b63b336a4d9864a181990ce45ece1f30b3d3"

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
