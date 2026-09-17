cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.0.17"
  sha256 arm:   "abf380309bf1d28341c6c857abb9ea2156cee7ed33496232db9f85c169c4d6bd",
         intel: "01f47f81cda4241a24ace547cafa6d221626fb33f36be59e5ebfc2ea2358fe28"

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
