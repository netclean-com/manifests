cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.371"
  sha256 arm:   "67a7b7fe6d5b2d5bddd7bf1271bbd556c38546cb4d514e3342f12c38b75611f2",
         intel: "334d303e79794478fc9091bf35e90c3761acf250c48c219c42928a22df61bad4"

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
