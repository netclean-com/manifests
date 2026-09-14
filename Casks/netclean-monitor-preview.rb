cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.0.11"
  sha256 arm:   "dd65c2a24d3a443c6357066ab1dfab3bb1466b629616e305360ebc115ab52484",
         intel: "78203fe065ee1582c7ca93bab44f768d594523bd0ac3a7dd25f2a0d61c6b2f23"

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
