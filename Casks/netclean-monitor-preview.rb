cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.0.7"
  sha256 arm:   "ab62ea53813170de41df19ac3946461d8a194f8129de70e906c82ae08c105399",
         intel: "37b7be51a2ab42e5c62a1979c163030c2a2d1696c01a3c007786ebae6a7ab07f"

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
