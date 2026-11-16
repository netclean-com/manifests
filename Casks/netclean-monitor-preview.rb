cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.51"
  sha256 arm:   "77e48e82b8f4b586b6146da745335e71fc82d68534f407023a1d69c2b714f04b",
         intel: "9d96d70af070649e7ca1fa43a3ae25850a6f177eea40d5c41d5509d768a0a6b9"

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
