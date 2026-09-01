cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.2.13"
  sha256 arm:   "c4ebd59fcbefdc5974256bde8ede9f97e87eadc601206ff4c38e9a612c770683",
         intel: "7e2850b47e1d7a9c80e8d00b12d806f35ec2a7de4cddf8aa210e9a59cb05c85c"

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
