cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.2.6"
  sha256 arm:   "03efe4e550e4515fd6757c76f09ae466a14d3da63032d2e5d28624f95dfdda31",
         intel: "11563500e3479bea71b7881def99129e48ba746d60ff9754aa8fc5c88a846aac"

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
