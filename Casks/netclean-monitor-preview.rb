cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.357"
  sha256 arm:   "1d42089e5dd067c9ac58456f604c2f71a6b43144ad63007e6500035ccd3eb00e",
         intel: "971cf53d1c2dbe641d9b28cebcf78f97d8e64759ac13241307c7a63f5ed61f76"

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
