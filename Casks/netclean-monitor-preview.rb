cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.1"
  sha256 arm:   "417036e46b743f3f2e34efc491c86fae302335b9d6a8c257263f73b6ee02a281",
         intel: "1d1bcd3176030d8fa5719e6d7005693e84947bf60746cc8af55b6d934fdfa9af"

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
