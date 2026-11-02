cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.20"
  sha256 arm:   "7b3027156a532d070d632340d323a4325d9e1b6faad1dbbace1bdcc7be44ad25",
         intel: "c2488ea290afbceca2a69ca9553b1aa97d16c5f151307728b05893a6c5cc1849"

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
