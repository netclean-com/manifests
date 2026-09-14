cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.0.14"
  sha256 arm:   "aadcd2ddb07094e6bdcf371fae9da1d9f522af8af21bdcadd2b453055935f9b6",
         intel: "275d7efaefc25192b10ee5ce6418c437f1047bf3a254cea7806112da61ea0013"

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
