cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.301"
  sha256 arm:   "ab0922936208ecac49c5d092dc112b08788d485a5b3d3b5bb56e04a5f12c5b04",
         intel: "0868889b7a345832d5ef87298ac798a6e72200df09ca5c05be5b579dcc3ba7b7"

  url "https://cdn.netclean.cloud/releases/monitor/preview/#{version}/netclean-monitor-#{version}-#{arch}.pkg",
      verified: "cdn.netclean.cloud/releases/monitor/"
  name "NetClean Monitor (Preview)"
  desc "Background monitoring daemon by NetClean Technologies AB (preview channel)"
  homepage "https://www.netclean.com/"

  livecheck do
    skip "Version is managed by the automated release pipeline"
  end

  conflicts_with cask: "netclean-monitor"
  depends_on macos: ">= :sequoia"
  depends_on arch: [:arm64, :intel]

  pkg "netclean-monitor-#{version}-#{arch}.pkg"

  uninstall script: {
    executable: "/bin/sh",
    args:       ["/Library/NetClean/Monitor/uninstall.sh"],
    sudo:       true,
  }
end
