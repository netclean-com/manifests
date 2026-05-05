cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.250"
  sha256 arm:   "ac6766de3ce166162d8ea32b8b6981ac5923d861a3bad82b0d655d4d74a819dd",
         intel: "3cb3c2cc7315d2e0c9f32f236220fd92ee4a69776023d5dbfc1fd4b151179344"

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
    executable: "/Library/NetClean/Monitor/uninstall.sh",
    sudo:       true,
  }
end
