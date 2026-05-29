cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.293"
  sha256 arm:   "c7a5492dd4172718eacb0c3dd43578191b5eabe4046321fe2c08eebb245162cf",
         intel: "e7c5c7cdec11fb80a81e16c820106861db1bf263e569680a11ee40d01d2f3ebc"

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
