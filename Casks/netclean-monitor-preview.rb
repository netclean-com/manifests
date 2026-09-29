cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.9"
  sha256 arm:   "6f2b7be61c7a4eeafc9558a43742cc9702b121d344b3099d01a2ac0423faac60",
         intel: "201ac43adc508f67923ea568c2c654037219a9f3e6b67b5e835073ff50625825"

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
