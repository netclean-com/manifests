cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.363"
  sha256 arm:   "51fa931e060a1a590261f247ab309232ede8853a5b7013fff519ff4c1c8dc30d",
         intel: "b9ba036b792893d9b29422f70128221563f8ea9a4e75b33ce889fa85f4bd5d80"

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
