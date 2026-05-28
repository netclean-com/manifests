cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.287"
  sha256 arm:   "543af291aa073f971e3d624931fe9e3dbf35ff2fa8995553da781ca72cf58ccb",
         intel: "59dfa6ebd5a9658f273d2eca2507405397028f073fddf05b5a803748b0ea91f9"

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
