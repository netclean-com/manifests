cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.306"
  sha256 arm:   "26a1eb8755c0c2edce0da81c5dd0a014bbd7e59d4df3e3409caa45e4ba5b919a",
         intel: "72372e70ca2890f2de6c000cb5020431ae9760f799eb1d08bb2c7dcfaf1862c7"

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
