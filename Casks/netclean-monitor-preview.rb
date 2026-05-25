cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.280"
  sha256 arm:   "2949c11a1a92ab56241169c9ad41ff41300e072fb1c62276c46abf55c493065d",
         intel: "d9bca7c95fcaa857e9490a3ce7109ec1fe8643d6b4f33687ae5f030d49e15abc"

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
