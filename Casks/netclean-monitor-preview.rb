cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.396"
  sha256 arm:   "6ad9bd49f6947e5364aee3fd9e9617e4ea0b514612bad5d8143d1f7bf947b6fb",
         intel: "f0098e83bfe0612c70491d09f1cf7d36b932658d8fe8ee513ae184050ee1d974"

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
