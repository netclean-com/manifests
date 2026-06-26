cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.355"
  sha256 arm:   "2e899de5849624d35cdb44ccc1606c5d3f0b61141c101e904b994573364a99ea",
         intel: "1fd1fec9049499f50ae05b9131802f19ab92f1861cbb1ffd16c662f6eb074baf"

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
