cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.374"
  sha256 arm:   "f86479f4538c1596c6351d7388913f2695cb5b066876db23043b4a0754f38888",
         intel: "f75a9e5f562d10f3f50396164b3fc7e14f5403aeced130cf5f767751dc1f40ae"

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
