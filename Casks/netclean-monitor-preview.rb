cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.2.1"
  sha256 arm:   "65d928f58e8719c475f83c52012fa97e90a8d2ed22f92127583e16c3b3a33ef4",
         intel: "4dfdcbf34670e86c743b8835e371eb6a419902c693ef3dfbcff7b507760e8fa7"

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
