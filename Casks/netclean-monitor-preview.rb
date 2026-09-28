cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.7"
  sha256 arm:   "e6570c9e2da94de63c67903f661934e4588c25845b84548d43bad042ff7c8aed",
         intel: "2e9aa1af3ef28d91e9375f73075063f94d818f57274f07ed9a7cb33e2ed3a4f0"

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
