cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.58"
  sha256 arm:   "9e7de583fb6522d9aadc0942ea54e8593c7f1b06c4103f34b3decf933bf9f82e",
         intel: "95cf488b796b4460c5b1df90c93ab2e20b0573b5cdd31e597748072ab5027849"

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
