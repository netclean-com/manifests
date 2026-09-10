cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.0.9"
  sha256 arm:   "d8d7abbf454b819c623d0d4342734c4432c2237f5635ece0591385dfbefc53c0",
         intel: "3acacf4eec538e4e60002cf352d9e7e78bdbf4982e2569d936b06bd5027a2351"

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
