cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.369"
  sha256 arm:   "7569e09a9a7ddf3593eb1a13765741d15780b62fa0f09de713cdaedb8d4d9a55",
         intel: "5beebf37bd6b33ca5b82dca8e5be6fb1735cc7b30172af60dcdfe14b21763d9f"

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
