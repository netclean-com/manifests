cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.291"
  sha256 arm:   "9a0bec9dd749c37b89e4f3bf4caecb8db63b70cf283f3bc7b96c1babc7cc56e7",
         intel: "2680faaffbc8ff29edfb549474979757349a8ca38629daa778a3e3088112f7ae"

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
