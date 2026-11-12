cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "1.1.46"
  sha256 arm:   "96a35af357dd5d940c3de6257f129a28aa765b7ba4457757b4bbb16d8099be34",
         intel: "2d4d2710a4a67137fdcd6f322d75a0cb9003433627e17e214849d4287037f76f"

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
