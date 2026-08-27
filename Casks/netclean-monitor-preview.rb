cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.1.16"
  sha256 arm:   "878bae9e55bfe29c21aee2519c9c541c8e4fe518788fdb0190858210a9cb4d96",
         intel: "dcf2877407edae86f49f2b871750b17d5e75709fcb0a2aacf4be1e58c63c3a68"

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
