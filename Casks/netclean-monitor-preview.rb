cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.350"
  sha256 arm:   "66dcbbcbace6d2ba83c6c05bccb40d18b182dd3a1b060792c480698da8b11092",
         intel: "fbc45bc078ba45e1165f4471868bd6f4ba02e7a5ab5f562ec30fe75e8d67f44d"

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
