cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.303"
  sha256 arm:   "56a154ec1cf0adf3f69f071a949a6f78c939ff668f7630b42415246ddc7be243",
         intel: "a5d21b03920dadded13af6e3153272f6f2a5d0e9790543fafbdaa254af1437bb"

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
