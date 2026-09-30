cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.11"
  sha256 arm:   "a6f110077cea1daf0b7752965a4802fda2eb0a04437207065b737d276b82182e",
         intel: "5dea246749ef1fae65720bfd4f190ad0170f9887cc23cfb5ae5c038c5135f895"

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
