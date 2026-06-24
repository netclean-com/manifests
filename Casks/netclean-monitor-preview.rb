cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.348"
  sha256 arm:   "6d230b498bd7f46174f3eff3a76eafb47e52abf60208f2f1f2efa4c18280361b",
         intel: "054f20508d94ad76702aa6999718651b22c2d1d246dd03b050491bae62b35bf7"

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
