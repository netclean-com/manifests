cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.362"
  sha256 arm:   "256781060e92d43d79c6df52c80f15c23d4088b1e45ef77c9ad7152f377c57d1",
         intel: "f532002e4ab4be8d66ff1408009cfe5c0c31b6c86e8731d0adcff0f6ccfa3fc5"

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
