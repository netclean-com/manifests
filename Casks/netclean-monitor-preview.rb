cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.387"
  sha256 arm:   "18042bc85f99a4db1dd7a36c653619b72be18a849eefb3ce702bc098cbc0ea01",
         intel: "4883a5f0b0fbe274f841db965d4b59179626eed00d0ec41aa51ef68cd93bf4df"

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
