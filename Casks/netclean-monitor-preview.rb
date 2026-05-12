cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.260"
  sha256 arm:   "4c16b4415d8f3dd7f6c6d6f6360581f8257340e4bec4212acd5780dd8ab6a5fb",
         intel: "503b63734d7c0869f3885fc6da9236af6bbd699c6d5d3dfd8dba5f04d531462f"

  url "https://cdn.netclean.cloud/releases/monitor/preview/#{version}/netclean-monitor-#{version}-#{arch}.pkg",
      verified: "cdn.netclean.cloud/releases/monitor/"
  name "NetClean Monitor (Preview)"
  desc "Background monitoring daemon by NetClean Technologies AB (preview channel)"
  homepage "https://www.netclean.com/"

  livecheck do
    skip "Version is managed by the automated release pipeline"
  end

  conflicts_with cask: "netclean-monitor"
  depends_on macos: ">= :sequoia"
  depends_on arch: [:arm64, :intel]

  pkg "netclean-monitor-#{version}-#{arch}.pkg"

  uninstall script: {
    executable: "/bin/sh",
    args:       ["/Library/NetClean/Monitor/uninstall.sh"],
    sudo:       true,
  }
end
