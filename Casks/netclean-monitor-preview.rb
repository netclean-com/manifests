cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.29"
  sha256 arm:   "0d5d06678f9eed1f132f998cb003106d523430670a196557de063ce776863ea8",
         intel: "2cdd765d765420d81fa748d1f64fd9dc1c91b5c925366b7a5e9dbb395d044ff2"

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
