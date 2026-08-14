cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.384"
  sha256 arm:   "61104c4afff76f96ec0b9233375fc7f241972519af93ed6fba781e94a788970d",
         intel: "5fbc901afb635c58989445e5e60dafca07090e5ab3b8de61e18e5cb7c15df954"

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
