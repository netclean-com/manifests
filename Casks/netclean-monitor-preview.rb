cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.368"
  sha256 arm:   "c911ce906a640f93428c4868d2dfbed7ac96e435d5014df58562a2a26a5d1e29",
         intel: "0db6aa3ba29ef573dc135460840ba9f9c546b9b7f6a61ad48e002998f17269ce"

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
