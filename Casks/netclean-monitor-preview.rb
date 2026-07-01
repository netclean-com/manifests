cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.365"
  sha256 arm:   "0581447f70983cbde0bf147f2422a0729f2dbe17bd082dbd645d566aba298ce9",
         intel: "82f847cc5efb7469b150e49690d53b8f999589fba437f33a3d614c180f59d7c7"

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
