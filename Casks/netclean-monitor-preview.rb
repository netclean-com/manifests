cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.381"
  sha256 arm:   "57c88a3d89ae3c36d16bebca9b1772b9c091d2d1bc21f263e51adfce560dc2b5",
         intel: "cde1aa1766abe0f8d2c0e0548febfbeae8fb43e786ded6724d0f46dcd7ff7345"

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
