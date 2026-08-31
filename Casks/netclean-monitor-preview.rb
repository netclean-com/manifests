cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.2.11"
  sha256 arm:   "6228eb3642bc679e5025ceeb92a37c63c26155416f69bebc516acfcb6a6500c6",
         intel: "a49f4d2bb25b3e1be2c8d6b36d750a78a79c77684016343111e6e3c556b308db"

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
