cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.57"
  sha256 arm:   "f32f37a96e20ca5a2741cdf7a9d08a761743a2ad3d86a7f416bae83ca1e4852c",
         intel: "5a5e5d652ce7a4c3f374b47a4f4af4b47e835263821a7bce8b2dab6814e20b45"

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
