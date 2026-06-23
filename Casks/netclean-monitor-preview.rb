cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.339"
  sha256 arm:   "8707291cdd2fb616eb0e3dacf0cd3de07cdc4509db6700c076f68993bb973d33",
         intel: "880dd9b0a17101b3982339bf0ffecbb84e08138ef729b00d079cfb90b59c7302"

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
