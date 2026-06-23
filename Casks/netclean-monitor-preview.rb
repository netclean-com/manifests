cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.341"
  sha256 arm:   "a67acb515cf97807c351dac6f51d5880e8694ec3c53acf153b05b37f349c1ba2",
         intel: "17f90e20885d6a7ffa21687a84ded183db117531eeb0dda9ffb34ff5bca7fbf1"

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
