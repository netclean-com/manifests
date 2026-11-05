cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.36"
  sha256 arm:   "702e3047691e4bc9fc9c402f4e4c13e5a135a2fd40047a3236bfe0c6deeba1b9",
         intel: "5e5bd2ac456282e2dc95463bbdcfa256ca669381c71416cf753a4dea674c6ebd"

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
