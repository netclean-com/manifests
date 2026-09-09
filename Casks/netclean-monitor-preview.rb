cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.0.4"
  sha256 arm:   "c236aed14bfc2d9316088fcc760ba4ebd4ebe792ac348f4a97baa1efb667ff2d",
         intel: "762ef5c2111b490783e7e4ee3cb57ce793b5b9bc2ae2746bafafcc4e07cb0fb3"

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
