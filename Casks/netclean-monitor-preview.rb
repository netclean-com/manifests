cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.256"
  sha256 arm:   "23b1f1ef5a0a1cba216e4e76c517ccd52f510c7892b43a065cecce886adb2706",
         intel: "085867d2c8fc02cc3575af86145c45ee2c005d44bae65a9d524bd4278f637295"

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
    executable: "/Library/NetClean/Monitor/uninstall.sh",
    sudo:       true,
  }
end
