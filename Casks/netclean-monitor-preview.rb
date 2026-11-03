cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.31"
  sha256 arm:   "e30e8c5662930476aae7abd86757e25b70a6e4799d33b3264c5d187307b583ef",
         intel: "538224c74274397ade638ce59c51fbdc3fd13ecd8c526d6231d5c742ccf8943e"

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
