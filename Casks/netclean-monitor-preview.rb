cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.44"
  sha256 arm:   "8af8669bed9816bd0cf1c33505dd5208f3dc7821f0f8fc8cab71bffd5d816d6a",
         intel: "922d4c386a74b28fbc6f067a32c075fcdbb105d402797160430a3fe8533d0a7a"

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
