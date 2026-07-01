cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.364"
  sha256 arm:   "e150fd9b2ac5fa8e0b1e46c2214afafa626e20473473fced1a90eba57591c65d",
         intel: "9ead0417a7926414fa46f488311b75f6dc2c0ed57f2aadafc1f10450a817bf45"

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
