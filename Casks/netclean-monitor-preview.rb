cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.395"
  sha256 arm:   "e83aff4c37d7d432a631e8c75fd0e2723582ec894c3fc87bdbd2d1a6f9fea566",
         intel: "ca2aef1b22b32e7189833a3beb7be2fa5fd1e181e699070fae2437dd2e287d85"

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
