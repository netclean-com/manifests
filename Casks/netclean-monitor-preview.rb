cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.372"
  sha256 arm:   "eedaa3658966c8a3e94d6cdb20fd13ae9bd2266a99427d77082a63dcf7a582a0",
         intel: "bc66c2bdd69574c3a8426911a49bf2af4e6a1240ddb7a0bbbcea950a2c762ed0"

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
