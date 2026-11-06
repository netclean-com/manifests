cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.37"
  sha256 arm:   "bba70cdbb23b82773831734fa7d8d356c1aa1aa29a197814b02a68b091ce2411",
         intel: "f8c9e2722ebd777f16980b25ebf57e3db940dfccb4815ce3b8bf65be819ae2c0"

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
