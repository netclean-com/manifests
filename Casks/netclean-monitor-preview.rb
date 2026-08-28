cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.2.5"
  sha256 arm:   "e2d4354abb2a7fb5e0af80abf484c1e3ac05159ede3913d2593ec1c74b14502a",
         intel: "0a03c7965c4f190b420c890d8040b045b5a83a912cd54b00704d91b8a0d25426"

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
