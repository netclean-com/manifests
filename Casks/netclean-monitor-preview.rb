cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.340"
  sha256 arm:   "4b39097a2a556e10c18586872bd734687060e169a9601a4ab4d2313a338ca730",
         intel: "a2e4b8afcfe1bdddf752f69a4f12c0a05c1461df6a5801c4dceabaae164494c5"

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
