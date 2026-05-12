cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.264"
  sha256 arm:   "debe5ca78d166a3a0264a4ddfc1db4d5d5b4495a04b863997d8090672e2c595e",
         intel: "fed9ec12de4019dbe525c55b052586db5a75e7e15d0d1e232d32a3c02090b3cd"

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
