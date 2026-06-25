cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.354"
  sha256 arm:   "83961a9b03610adb8f58dde4a0de9f20e8b70c7318083cf58f9a39f1c73d6c54",
         intel: "24f9af3f947e15bdf17a1b37825ba31750b702020a08ee3c134757cbf38c3aa3"

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
