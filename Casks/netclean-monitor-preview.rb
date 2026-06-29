cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.360"
  sha256 arm:   "e83c2e146b03ce53d06e4a9bbf7a6f281a8b160bdfd5fa779027bd2028e7d39c",
         intel: "306fd712d7cde17ca76d4eba1201ed0052167e62bf527161a186a2e90917cf24"

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
