cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.304"
  sha256 arm:   "d1b4bd8c9922ccacc06d8bed4fbc0a6de9804239f9c3a842f96b9c0c77eaa4f6",
         intel: "885d8b76328df8d2f5b5f74128daeb8577b98466a513769115af060b6525179a"

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
