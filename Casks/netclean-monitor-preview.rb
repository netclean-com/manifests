cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.379"
  sha256 arm:   "c9e4d857c7553fbc93b3775f39916f64ed6cc2a1ee8f26812454e9eb6a2b3c5b",
         intel: "c2248c17d075b49a75b53ddc7afceed37884a5a35dac741febd1bc897f2a6818"

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
