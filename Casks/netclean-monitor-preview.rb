cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.331"
  sha256 arm:   "7b3572af324bfcdf4506b8efe8ad2b110b52bbf8f632d67cc374643f895d061e",
         intel: "0be30c6708cd3bacb77174bfbb426d9de5c65652decd89e8d2558c9e1b5a54f8"

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
