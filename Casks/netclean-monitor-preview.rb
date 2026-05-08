cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.258"
  sha256 arm:   "ea6cb0b283c8df70a530675c587568a180ebf71bceee28c3ab4f6977a5ebbdb3",
         intel: "0cabf60055de8f964e43cc1afec018b0d8dda2537ebdf70b6a9e01511d596074"

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
