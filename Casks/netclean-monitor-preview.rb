cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.324"
  sha256 arm:   "e7a645077541dca6b59b2caffbbeecb1c1bc54d512b710d7a447d19af36bc4ab",
         intel: "b9a6023e2bc647f803e21fbe94625252f8fac2420f47965eb6bc4e4333e1209b"

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
