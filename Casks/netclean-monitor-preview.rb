cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.14"
  sha256 arm:   "f38b9b0124c34286e9b16a8ebb5e9d52c839dd6d415828734406affe0ca5691d",
         intel: "1164d9737c70d4592990e3ebfa2c022e2e75fa4f49d1718599cc227530d7889b"

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
