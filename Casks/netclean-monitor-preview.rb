cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.271"
  sha256 arm:   "332f4f54f46dfe7f5c8ae373ed2553f139c6f531239efcfbd5da9e43aab4eeb8",
         intel: "5c85dae756427972881e9e559cd8338a6eafc7f2b6fb00460dd14e9466474b32"

  url "https://cdn.netclean.cloud/releases/monitor/preview/#{version}/netclean-monitor-#{version}-#{arch}.pkg",
      verified: "cdn.netclean.cloud/releases/monitor/"
  name "NetClean Monitor (Preview)"
  desc "Background monitoring daemon by NetClean Technologies AB (preview channel)"
  homepage "https://www.netclean.com/"

  livecheck do
    skip "Version is managed by the automated release pipeline"
  end

  conflicts_with cask: "netclean-monitor"
  depends_on macos: ">= :sequoia"
  depends_on arch: [:arm64, :intel]

  pkg "netclean-monitor-#{version}-#{arch}.pkg"

  uninstall script: {
    executable: "/bin/sh",
    args:       ["/Library/NetClean/Monitor/uninstall.sh"],
    sudo:       true,
  }
end
