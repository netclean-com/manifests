cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.346"
  sha256 arm:   "cd05bd63046c51cb230d7a50eacb200736193ba318fd0c580803adb1de79d278",
         intel: "f40858e5f055b9f5b194c3490d6b5abc4951a03f6e06d90312afff6ccb8296af"

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
