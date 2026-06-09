cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.323"
  sha256 arm:   "ede39fe1b78a578c4040489ac372398891b9f7dd4ce962b1f2e09b0a8819d056",
         intel: "cea22de5f1972f6b1ccdad284e815c1973ad19957ffd04f2a38b1d72c1a085c3"

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
