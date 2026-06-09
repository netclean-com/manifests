cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.320"
  sha256 arm:   "a8d7fafef81ee7a9df3121b6b8be2075a96c7ce2fc42dc35074219d2f532a3c8",
         intel: "493cffe0c55f75e553987acbe5ab60c7d76c2ac4dd0ff02e73a5c9a2524cdaad"

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
