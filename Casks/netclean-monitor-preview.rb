cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.285"
  sha256 arm:   "e98d5f782e643983f150c119dbaa9fd83df51041bb820bbfb77f47e6f5dee52f",
         intel: "ae6b113ad0555bdfa0fef538728d8b0281682764cd62258095a11c6ae5c61339"

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
