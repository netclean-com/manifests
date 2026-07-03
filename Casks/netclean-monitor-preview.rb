cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.377"
  sha256 arm:   "77d053715acfbd2fd22043bc0f4a8aee7ef01e4b78fb9b461986d744632a3850",
         intel: "e8a2d67e35df6e5bc6d1ed10c2d6c555f0ebdff7e4e48a188a22f702dc96e3aa"

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
