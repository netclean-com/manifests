cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.344"
  sha256 arm:   "c4cc0928205bc2f118b9ab0ef22fae7186171df5e6a9453ea4f659d48f1584cc",
         intel: "248f91321854cd909a8ea773a33c36225ee17039f5a0a2dfc0e47d579a5965c8"

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
