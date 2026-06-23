cask "netclean-monitor-preview" do
  arch arm: "arm64", intel: "x64"

  version "0.0.338"
  sha256 arm:   "9ef26af241141176329819011411bc7fcb797d1699aa5a394b1d455a1a0951ae",
         intel: "c625e2ac1f412a6bb44929af76c99387e2f53fc90edf16ae64a3b7817bbaa6b4"

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
