cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.34"
  sha256 arm:   "11b842770e5eca1e0035bb01441a626a3c900e490c01cdad153434577d6433b4",
         intel: "ffc54d0702becf1d20dc1b0398d2d132ec1dc5ff3cb905d2186d428440572f17"

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
