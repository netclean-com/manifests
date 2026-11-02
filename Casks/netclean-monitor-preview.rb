cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.24"
  sha256 arm:   "1f54b96a0d1e65058aa094b99cbdb3927a31c1b838cb74b785365b706d1ac6cb",
         intel: "9d0075ee5b42365f3b9629c4c44ee47d1fc02f45e6b3343e3f5ca49e236bbae8"

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
