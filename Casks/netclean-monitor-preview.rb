cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.0.3"
  sha256 arm:   "7a7e6943246c14e9f93156889317c56be01f1c97001865f9b16e46060d447325",
         intel: "032a4b35387e8b1d9f17e30dee64c0c864dad16f7e93c97c21d847c2734145d3"

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
