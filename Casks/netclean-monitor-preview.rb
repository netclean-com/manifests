cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.32"
  sha256 arm:   "b25a90c2fa3c098f164e13ef57e43b3cbcc313b61f302d42b0ec339b59d8b95c",
         intel: "2e896e934f0aedfcac8016fc665224194d9e5b94be63174de8c4d14a57e8050d"

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
