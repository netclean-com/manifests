cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.0.19"
  sha256 arm:   "46b24442079e02aed8ec4367964f92520900edc5c428b1d8fe8c807c043381e9",
         intel: "61bf0265435c6d4b31d7da4815161ce4a12e20d84de822bc447bb98236720ddc"

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
