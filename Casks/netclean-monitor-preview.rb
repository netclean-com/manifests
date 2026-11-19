cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.59"
  sha256 arm:   "5a2bf025574007b3ed54698bf1af9965c258f5f7b18c857b8a6e9bca3747c8f4",
         intel: "650c8de2f804bba972a9e0eb1f1089dada1e4c3e123d3913933ac8af67aaf875"

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
