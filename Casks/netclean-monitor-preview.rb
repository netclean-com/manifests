cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.289"
  sha256 arm:   "ba16dd33adb46ed95e2f4353a404c62ddb56ef833cd94c094360053ce3cf77b2",
         intel: "f5289382e0c827ebcfb52b40ecfae2e4e5e1754f0ad77ae8d4e0d7926e94982a"

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
