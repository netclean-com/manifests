cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.267"
  sha256 arm:   "41b1ad124c047ffb2eb733b501936e07f6fcc4a53c395d5802e805aa6a00f83b",
         intel: "1823a7db9ae11b8abb2535c3008380b1227f796046f0114a9af627b4618164d5"

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
    executable: "/bin/sh",
    args:       ["/Library/NetClean/Monitor/uninstall.sh"],
    sudo:       true,
  }
end
