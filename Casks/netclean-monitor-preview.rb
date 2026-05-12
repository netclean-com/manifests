cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.261"
  sha256 arm:   "424f9bf2a70d444eed4d5aa62d081b077ae3512ae2954f6cc57d8de2e96c9474",
         intel: "631b0ea29e7169d26732b50561e5a83eae1dc1ee6028f7f979687c3fb01c2699"

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
