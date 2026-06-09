cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.318"
  sha256 arm:   "b61f8b5192614900d7597d4988d114deb2359bc0dbb8fec84b49697ae64c7768",
         intel: "00003fb50b4f7b871e95b1fafe4b135e14080ceb0326dac63d0ff81f447bdbd6"

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
