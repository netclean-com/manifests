cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.342"
  sha256 arm:   "49d626e10b39d7f871a19edd891b85059980832a4e4cb58783b79b790143eecb",
         intel: "2137afd6c5d40ba8e81168a6953d75db67797e707b1b6e3fdb5fb7a0c97ca24f"

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
