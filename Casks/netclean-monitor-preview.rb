cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.26"
  sha256 arm:   "cf13e0dbe197c666e98a176e518d1ab80f14c7c85fc7e0cb75788f0f10201ac9",
         intel: "9a90ee79faba15ff578c6c20cb3bf1618283397b80432f31d0bb12c33d1e37d8"

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
