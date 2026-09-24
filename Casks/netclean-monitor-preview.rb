cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.4"
  sha256 arm:   "b493f91604e2e73116e45fbc97744e434145d0fe07a562fca7e33f0c86710f8b",
         intel: "356920b87ad5f5be8424c1a9654e8c5db3998cccdd79b2391e2f59bd85b29571"

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
