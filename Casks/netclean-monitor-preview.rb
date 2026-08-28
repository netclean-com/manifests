cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.2.4"
  sha256 arm:   "f56bc7776e90eed8494156d3188ba5baa5c4602f43e78c255587adb46fd5cadf",
         intel: "9d9b7a692cf8ef8c2c76ba060e800a50113a9931659bdc57292544aace67ca8a"

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
