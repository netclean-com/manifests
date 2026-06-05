cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.309"
  sha256 arm:   "81a2ab833a250600e6c8b9250f54011cc06f925c62e8a0b45edcd7feecc8d100",
         intel: "67b870ff62cb5fbed092e4c837e66138f547a524eea0fcc33c29bced1d27e405"

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
