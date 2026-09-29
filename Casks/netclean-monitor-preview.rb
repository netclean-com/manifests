cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.10"
  sha256 arm:   "41ddf420149d249fae9d11d74f1cb702a7ab436afd28815a2ba2c82fde0f8287",
         intel: "559e987f9fbf257a8aa3c90fd89d6c50cabcbf17556791d2e0c744421b5accf1"

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
