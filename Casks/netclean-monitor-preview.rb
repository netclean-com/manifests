cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.361"
  sha256 arm:   "8c082cd6389c800fd2f5fbc8e501b70e287e7f08c088304db56fd809d569a420",
         intel: "970e3fbc64d2ebbb9b6dd732662f05219f1a4979cffb5f50e36c5a7e15e5f1a3"

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
