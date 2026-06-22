cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.337"
  sha256 arm:   "bb52ca4b7c4f9fca42b34c4ba6abbab3e0019ecf4f96f8d3dd631b1b568f3c8f",
         intel: "f51bd526aecaab2221642991eaf50473f2178e27f0a45f2096440c87693a97c8"

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
