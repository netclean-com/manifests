cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.370"
  sha256 arm:   "1baa24752a97c05ed285525f9f2b5f5640eeda16f5f4730f9b330391f6de64c5",
         intel: "4ae445cb8741284446d5fa292d76158dd7c7e9581c275e57afa08f9778f67ea7"

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
