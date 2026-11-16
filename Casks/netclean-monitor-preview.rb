cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.54"
  sha256 arm:   "532b47ba63214a7d191d7a8d1e431e4382f6529d21b5a84ff85981ee48cb1bf4",
         intel: "eeb736e345b9c44ef9e9609f17756de744dde6d97bb4592da3d5b4e4108faf87"

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
