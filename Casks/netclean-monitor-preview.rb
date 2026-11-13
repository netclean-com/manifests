cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.48"
  sha256 arm:   "b3fc9e1bedca74641d56944556226976e5fd00a49ea165e2f95c35a845bbec55",
         intel: "36e20a68a66843cc293f030c9603094c1e72f00e5b32618390e225a7104c5d6c"

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
